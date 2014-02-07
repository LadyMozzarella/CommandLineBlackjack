This repo represents your first team project.

Your challenge is to work with your team to build something meaningful.  That's it.  

Sweet!  Or scary?

Wondering where you can find some inspiration?  How about some of the applications you've built over the past weeks -- can you grow or refine them?  If you have an idea in mind already, be careful ... precious ideas make for emotionally intense projects.  

Agree up front on your top level goal: **learning**.  

You'll have plenty of time to write apps that save lives later.  Focus your attention on your craft now.  Save fame and fortune for tomorrow.

You might start by scanning the text below, establishing a working agreement with your team and doing some lightweight planning.  

Try to get feedback on the scope of your project before you start writing any software.

---

the following is an overview of agile software development, arguably the best modern technology for teams.

---

# overview

*this writeup is intended to help DBC teachers and students talk about agile.  this is by no means complete.  feel free to edit as needed.*

### topics

- defining agile 
  - mindset
  - values
  - principles
  - practices
- working agreements
- user stories 
- story points and agile estimation
- information radiators


# defining agile

"agile" is an overused word that's often confusing for people who haven't been exposed to more than one perspective on the matter.

some people believe it means "the way to run a project" like the one they were on a few years ago when their team decided to adopt a set of Scrum practices or XP (extreme programming) practices.  things went well so agile must be a good thing.

others wave agile away as "an excuse for people to stop following a disciplined process" of execution and reporting and instead just "do whatever works", hope for the best, and avoid real accountability.

i believe i have the truth: agile is a way of thinking.  a mindset.

this isn't my idea -- it belongs to the agile community.  they decided, in fact, a few years ago, by consensus, at a conference during a keynote deliverd by Alistair Cockburn.  so, there you have it.  agile is a mindset.

anyway, here's a picture that will help us move along:

![thinking about agile][agile mindset]

### so what's this picture about?

there's this mindset, a way of thinking, that's defined by the 4 values of the [agile manifesto][], clarified through the [12 principles of agile][] and deployed as a set of [dozens of practices][] with [hundreds](http://pragprog.com/categories/practices) [of](http://www.agiledevpractices.com/program/) [variants](http://en.wikipedia.org/wiki/Scrum_(development)) [around](http://en.wikipedia.org/wiki/Extreme_Programming) [the](http://en.wikipedia.org/wiki/Feature_Driven_Development) [world](http://en.wikipedia.org/wiki/Dynamic_Systems_Development_Method).  

Did you notice how many different links were in that last sentence?

### the 4 core values of agile

in 2001 a group of seasoned professional developers got together to try to figure out why they all seemed to see things a certain way -- the same way -- while their managers and executives rarely understood their perspective.  to bridge this cultural and professional divide, this is what they came up with:

- individuals and interactions -- are more worthy of our attention than -- processes and tools
- working software -- is more worthy of our attention than -- comprehensive documentation
- customer collaboration -- is more worthy of our attention than -- contract negotiation
- responding to change -- is more worthy of our attention than -- following a plan

these 4 core values established the "rules to live by" for the agile community and basically no one disagrees on them, ever.  probably because they make a lot of sense, but mostly because they highlight a fundamental difference between the thinking styles of "old" vs "new".  if you're new to software development, these values probably seem too obvious to need to be written down.  what might surprise you is how much of a shock these values were to the industrialized software industry of 2001.

### the 12 principles of agile 

to clarify the intent behind the 4 values, the same group of seasoned professional developers sat down again to write the following:

- Our highest priority is to satisfy the customer through early and continuous delivery of valuable software.
- Welcome changing requirements, even late in development. Agile processes harness change for the customer's competitive advantage.
- Deliver working software frequently, from a couple of weeks to a couple of months, with a preference to the shorter timescale.
- Business people and developers must worktogether daily throughout the project.
- Build projects around motivated individuals. Give them the environment and support they need, and trust them to get the job done.
- The most efficient and effective method ofconveying information to and within a development team is face-to-face conversation.
- Working software is the primary measure of progress.
- Agile processes promote sustainable development. The sponsors, developers, and users should be able to maintain a constant pace indefinitely.
- Continuous attention to technical excellence and good design enhances agility.
- Simplicity--the art of maximizing the amount of work not done--is essential.
- The best architectures, requirements, and designs emerge from self-organizing teams.
- At regular intervals, the team reflects on how to become more effective, then tunes and adjusts its behavior accordingly.

and with that, agile was born.

### a few examples of the hundreds of real-world practices

practically speaking, values and principles don't pay the bills.  on real world software projects, people have to make decisions about things like time and space, tools and technologies -- tradeoff after tradeoff.  

to help streamline these decisions as well as encode the values and principles into a playbook for professionals, the agile community started collecting, inventing and tweaking the things they did every day.  they called these "practices".

here are a few of the most consistently deployed practices of agile:

- iterations: consistent chunks of time that a team uses to pace itself, usually multiple days or weeks, often variable based on team and project size, complexity and other factors. [more on iterations](http://guide.agilealliance.org/guide/iteration.html)
- pairing: two or more people working together towards the same goal, usually coding together, often with a cooperative stance and sometimes playful or mischievous to keep each other energized.  [more on pairing](http://www.versionone.com/Agile101/Pair_Programming.asp)
- retrospectives: a sanctioned period of reflection for the entire team with many variations. [this book lists a few](http://www.amazon.com/Agile-Retrospectives-Making-Teams-Great/dp/0977616649)
- standups: a regular pulse where the team surfaces what is about to happen and any expected blockers, usually daily at a fixed time. [more on standups](http://www.mountaingoatsoftware.com/agile/scrum/daily-scrum/)
- user stories: a unit of value articulated from the perspective of the person who cares most about it. [more on user stories](http://www.extremeprogramming.org/rules/userstories.html)
- burn up/down charts: examples of information radiators that surface project progress to interested parties like team members and managers. [more on charts](http://www.clariostechnology.com/productivity/blog/burnupvsburndownchart)

### why all the different terms?

take some time to reflect on the above. do any of the values or principles make sense to you?  do they make theoretical sense or a real, practical, visceral sense?  do any of them not make sense or seem impractical?  the above is well worth an extended debate among your peers.  there's a lot to learn from considering, for example, why (or why not) individuals are interactions are worth more of your attention than processes and tools.

the fact is, while the agile community agrees on the above, they have a hard time agreeing on what to name this collection.  historically, the mindset, values, principles and practices come from a long line of experience, each with their own mythology and, of course, brand name:  here are a few:

- [eXtreme Programming (a.k.a., XP)](http://en.wikipedia.org/wiki/Extreme_programming)
- [Scrum (Abi's favorite)](http://en.wikipedia.org/wiki/Scrum_\(software_development\))
- [Kanban (Jeffrey's favorite)](http://en.wikipedia.org/wiki/Kanban)
- [Lean (Build, Measure, Learn)](http://www.allaboutagile.com/7-key-principles-of-lean-software-development-2/)

and here are two links from DBC teachers [Jeffrey Wescott](https://gist.github.com/jeffreywescott/5223873) and [Abi Noda](https://gist.github.com/abinoda/5867924) with more as well.

# working agreements

once you've decided to work with other human beings, things tend to get a little complicated.

working agreements are the shared guidelines by which the team operates on a regular basis. here are a couple of examples of [working agreements](http://www.iliokb.com/2012/04/example-working-agreement.html) (and [related norms, ground rules, values](http://agile.dzone.com/news/norms-values-working), etc).

the idea is that, once you're part of a team, it's impossible to operate independently without considering other members of your [tribe][].  you have to spend time (basically overhead) to work out how to interact with each other in a meaningful way.

consider, for example, that a project has just started on Friday and your team is supposed to work through the weekend.  does everyone agree on that plan?  what if someone on the team had other plans for the weekend?  when will everyone else find out?  not on Saturday morning, i hope.  you should establish a few basic things at the outset of any project:

- who is part of the team (by naming individuals)?
- what roles do they play (although generic roles are ok, specific roles are better)?
- how do people stay in touch (cell phones, email, etc)?
- when will the team work together vs apart?
- what are the working hours?
- what absences are expected?
- what are your goals as a team?
- what are your shared values as a team?

the initial overhead of generating a working agreement pays dividends down the road.  all teams should have some sort of working agreement to fall back on during times of uncertainty or conflict.  these guidelines help everyone stay on the same page.


# user stories

user stories are small, clear, independent chunks of value that a team uses to structure and organize its work.

user stories are primarily written from the perspective of a **persona**, or archetypical user, of the system to be built.  this imaginary user has wants and needs and expresses them through user stories.

read more about user stories, their purpose, a few examples and more at [mountain goat software](http://www.mountaingoatsoftware.com/topics/user-stories)

- [cards](http://1.bp.blogspot.com/_k29Vs3aHPNs/TVE4LXuamFI/AAAAAAAACSY/cpnxwiQx310/s320/user+story+asteroids.jpg)
- [post its](http://alistair.cockburn.us/get/1916)
- [organized as a set of releases](http://blog.piecemealgrowth.net/images/storymapping_illustratie_2.jpg)


# story points and agile estimation

it's important that stories are small so the team can implement a single story within a reasonable (hours..days) amount of time.  this way the team can create a sense of **velocity**, or speed, with which they move through the project.

the velocity doesn't come directly from the stories but from a unit of measuring effort called **story points**.  the conversation around story points is usually a bit confusing at first because most people don;t see the difference between estimating effort in terms of hours vs points until they come to understand the difference between defined vs empirical processes.

let's imagine that we're baking a cake.  
- we have all the ingredients in front of us.  
- we have done this many times before using the exact same tools (oven, baking pan, etc).  
- we have hung a "do not disturb" sign outside the kitchen door so we know that we will not be disturbed

would you expect that we can estimate how long it will take to finish the cake?  i would.  

in fact we can probably estimate how long it will take within +/- a minute or two.  

we can do this because 

(a) all parts of this system  behave in a predictable way (because we're so familiar with them) and 
(b) there are no external influences to interrupt our flow

let's call this thing a **defined process**, like launching a rocket (think: *T-minus-10..9..8..*), or flying in an airplane (although not taking off or landing), or riding a train in Japan.

defined processes are repeatable endeavors.  the time and effort related to these kinds of processes can be estimated precisely because they are repeatable (ie. predictable) and any new feature introduced into the process can be measured and its impact analyzed because of this general consistency in overall performance.

ok, that was fun.

now let's imagine that we're sitting in a car in traffic...
- we know *exactly* where we want to go (ie. home, work, the mountains)
- we've done this many times before

but something is different.  you can probably see where this is going so let's just go there right now.

this kind of process, one that we can't control because of all the variables affecting our experience, we might call an *empirical process* (ie. one that depends on the evidence we have at any given moment)

so, for example, we might check google maps for traffic predictions (how sweet is that, right?) or back in the days where we didn't all have the convenience of an interconnected super computer in our pocket we might have gotten out of the car and craned our neck to look ahead of us and see, just barely, what traffic might be like a few hundred or thousand feet away.

this kind of process, empirical processes, are the way they are because

(a) some or all parts of the system are highly variable in their performance
(b) external influences have large and unpredictable impacts on our flow

think of not just driving in traffic but also shopping for something important like buying a house or car, making a painting, or learning something new.

when we try to estimate the effort to complete work as software developers, we are fundamentally hamstrung by the nature of the work -- the empirical process of software development -- so to generate any meaningful estimates we need a different way to estimate work.  we can't use hours on the clock.

instead, we decide to think through this problem a little more:

- we need a way to predict the **amount** of work there is to be done
- we need a way to predict the **rate** of completion or velocity

and, because we're keen and clever:

- we would prefer to incorporate the [knowledge of the entire team](http://www.amazon.com/The-Wisdom-Crowds-James-Surowiecki/dp/0385721706)
- we recognize that, as human beings, relative measurement is easier than absolute measurement (**)

> (**) why is relative easier than absolute?  we're wired for it.  try it now.  look across the room to find two people standing near one another before answering these 2 questions: 
(would be nice to have some cogsci references here)
- exactly how tall (in inches) is the person on the left? this is *absolute* measurement.
- is the person on the left taller or shorter than the person on the right? this is *relative* measurement.

so, we want a way to measure the *amount* of work and the *rate* that we move through it while also incorporating the *wisdom of the crowd* and *take advantage of our natural strengths*

and with a wave of the magic wand: **story points** -- a unit of measure that doesn't depend on time but gives you a bunch of the benefits of estimation including a relative measure of complexity, understood by the entire team, that allows for arithmetic calculations in support of project estimation and overall visibility.

the devil is in the details on this one so if you're interested in more about story points and estimation, here are two reasonably good launching points that i just found:

[why use story points](http://programmers.stackexchange.com/questions/182057/why-do-we-use-story-points-instead-of-man-days-when-estimating-user-stories)
[agile estimation](http://www.agilebuddha.com/agile/agile-estimation-8-steps-to-successful-story-point-estimation/)


# information radiators

so now, as a team with a reasonably good understanding of agile, a solid working agreement, some user stories and, if we chose that adventure, some story points and estimation of our effort, what can we do to help ourselves stay on track?

a major contributor to the health of any team is the kinds of systems of feedback the team builds into their workflow.

[information radiators][] are tools with which teams "keep an eye on things" like [story boards][], [burn down charts][] (usually used within an iteration), [burn up charts][] (usually used across multiple iterations as part of a release or project phase).

these radiators might be digital or physical, they might be always visible or secured behind some kind of authentication system.  the point is that the team ought to be able to make visible the things that matter to it according to the working agreements set out at the beginning of a project.

[agile mindset]: http://f.cl.ly/items/2G1p0U0G132r1F352045/Screen%20Shot%202013-10-18%20at%203.38.27%20PM.png
[agile manifesto]: http://agilemanifesto.org
[12 principles of agile]: http://agilemanifesto.org/principles.html
[dozens of practices]: http://guide.agilealliance.org/

[working agreements]: http://www.iliokb.com/2012/04/example-working-agreement.html
[tribe]: http://sethgodin.typepad.com/seths_blog/files/TribesQA2.pdf

[information radiators]: http://www.panic.com/blog/wp-content/uploads/2010/03/statusboard.jpg
[story boards]: http://www.mountaingoatsoftware.com/system/asset/file/29/MockedTaskBoard.jpg
[burn down charts]: http://www.mountaingoatsoftware.com/uploads/blog/sprint-burndown.jpg
[burn up charts]: http://4.bp.blogspot.com/_gez10dNhuPk/SQExi1j16lI/AAAAAAAABlM/pqg4SgFBkIs/s400/Burnup.gif

