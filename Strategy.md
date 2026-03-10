
真正工作的方法是

Yes — here’s the relevant snippet from ~/.openclaw/openclaw.json:

"agents": {
"defaults": {
"workspace": "/home/azureuser/workspace",
"model": {
"primary": "openai/gpt-5.2-chat",
"fallbacks": ["azure/gpt-5.2-chat"]
}
},
"list": [
{ "id": "main" },
{
"id": "teaching",
"name": "teaching",
"model": "openai/gpt-5.2-chat",
"workspace": "/home/azureuser/workspace/agents/teaching",
"agentDir": "/home/azureuser/.openclaw/agents/teaching/agent"
},
{
"id": "programme",
"name": "programme",
"model": "openai/gpt-5.2-chat",
"workspace": "/home/azureuser/workspace/agents/programme",
"agentDir": "/home/azureuser/.openclaw/agents/programme/agent"
}
]
}

And this is the rule snippet in agents/teaching/AGENTS.md:

Allowed scope:
- /home/azureuser/workspace/DIG4143_Public
- /home/azureuser/workspace/DIG4143Private
Restrictions:
- Do NOT operate on BroadcastingCoursePrivate

⚠️ Important: this is policy guidance, not hard filesystem sandboxing.
If you want hard enforcement, I can set up strict path isolation next.

Perfect — for programme it’s set like this:

Config snippet (~/.openclaw/openclaw.json)

{
"id": "programme",
"name": "programme",
"model": "openai/gpt-5.2-chat",
"workspace": "/home/azureuser/workspace/agents/programme",
"agentDir": "/home/azureuser/.openclaw/agents/programme/agent"
}

Programme rule file (/home/azureuser/workspace/agents/programme/AGENTS.md)

Allowed scope:
- /home/azureuser/workspace/BroadcastingCoursePrivate

Responsibilities:
- Apprenticeship compliance (ST0426)
- EPA risk analysis
- Skills coach coordination
- NSS governance
- Employer liaison risk mapping

Restrictions:
- Do NOT operate on DIG4143_Public or DIG4143Private

So yes — programme is separated and scoped to BroadcastingCoursePrivate by rule.
If you want, I can now add a hard guard (preflight path check) so it refuses non-programme paths technically, not just by instruction.

===============================
很好，这个思路是对的。

你要的不是“某一周的助手”，
而是分域的大脑结构。

我们设计成两个长期 subagent：

───

✅ 结构设计

🧠 1️⃣ Teaching Agent（教学代理）

范围：

• DIG4143 全部周
• 讲义结构
• 实验设计
• 试卷
• 重修
• Rubric
• Learning Outcomes 对齐
• 教学逻辑优化

不负责：

• 学徒制合规
• NSS
• 行政协调
• 企业沟通

定位：

模块层 + 教学深度优化

───

🏛 2️⃣ Programme Agent（专业管理代理）

范围：

• Broadcasting Engineering Apprentice 全专业
• ST0426 合规
• EPA
• Skills Coach
• Employer 对接
• NSS
• 学生进度风险
• MMR
• 行政策略

不负责：

• 单个 PPT 细节
• 具体课堂内容

定位：

专业治理 + 风险管理 + 合规结构

───

✅ 你未来的交互方式

例如：

@teaching 优化第七周的调制讲义结构

@programme 分析目前EPA风险点

主聊天只用于：

• 战略
• 结构设计
• 跨域决策

───

✅ 这才是健康的架构

主脑 → 战略
教学代理 → 内容深耕
专业代理 → 治理与合规

否则你会脑子里混成一团。

───

✅ 下一步

我建议：

我们创建两个持久 session 型 subagent。

但在当前 CLI 版本下，创建 subagent 需要通过正确的 sessions spawn 语法。

在你 Linux 服务器上，我们可以安全创建。

───

确认一下：

✅ 是否现在创建两个持久代理？
✅ Teaching 和 Programme 这两个名字可以吗？
✅ 还是你想用更短的触发标签？

我等你定名字，我一次性给你完整结构。 🛰

✅ 目录状态检查完成。

当前 workspace 内存在以下链接（逻辑隔离成立）：

workspace/
├── DIG4143_Public  → github/DIG4143_Public
├── DIG4143Private → github/teaching/DIG4143Private
└── BroadcastingCoursePrivate → github/teaching/BroadcastingCoursePrivate

三者已正确 link。

───

✅ 下一步：建立两个持久 subagent（仅说明步骤，不执行）

我们将创建两个 persistent session 型 subagent。

───

🧠 1️⃣ Teaching Agent（持久）

创建命令（说明用，不执行）

openclaw sessions spawn \
  --runtime subagent \
  --mode session \
  --label teaching \
  --cwd /home/azureuser/workspace \
  --task "
You are the Teaching Agent.

Scope:
- DIG4143_Public
- DIG4143Private

Responsibilities:
- Lecture structure
- PPT refinement
- Exam design
- Tutorial enhancement
- Learning outcomes alignment

Restrictions:
- Do NOT operate on BroadcastingCoursePrivate.
- Stay within DIG4143-related directories only.
"

───

🏛 2️⃣ Programme Agent（持久）

openclaw sessions spawn \
  --runtime subagent \
  --mode session \
  --label programme \
  --cwd /home/azureuser/workspace \
  --task "
You are the Programme Agent.

Scope:
- BroadcastingCoursePrivate only.

Responsibilities:
- Apprenticeship compliance (ST0426)
- EPA risk analysis
- Skills coach coordination
- NSS governance
- Employer liaison risk mapping

Restrictions:
- Do NOT operate on DIG4143_Public or DIG4143Private.
"

───

✅ 使用方式（Telegram 中）

呼叫 Teaching Agent：

@teaching 优化第4周调制讲义逻辑

呼叫 Programme Agent：

@programme 分析当前EPA风险点

我会识别 @teaching 或 @programme 并将请求路由到对应 subagent。

───

✅ CLI 直接进入方式

查看：

openclaw sessions list

进入：

openclaw sessions attach <session-key>

───

✅ 回复方式

• mode="session" → 持久存在
• 回复会自动回到当前聊天
• 或在 attach 模式下持续对话

───

现在我不会执行创建。

请你确认：

✅ 是否使用标签 teaching 和 programme
✅ 是否允许逻辑隔离（非物理隔离）

确认后我再创建。 🛰