From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Sun, 24 Mar 2013 09:05:48 +0000 (UTC)
Message-ID: <20130324090548.041CC11FB35@bugzilla.kernel.org>
References: <bug-55411-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-55411-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55411





--- Comment #29 from Thomas Renninger <trenn@suse.de>  2013-03-24 09:05:47 ---
On Friday, March 22, 2013 03:04:03 PM Thomas Renninger wrote:
> On Friday, March 22, 2013 07:13:33 PM Viresh Kumar wrote:
> > Hi guys,
> > 
> > I will answer to questions of both of you in this mail.
> > 
> > On 22 March 2013 18:23, Thomas Renninger <trenn@suse.de> wrote:
> > > Is this all to try to fix "cpufreq driver gets loaded while some cores
> > > were set offline before"?
> > 
> > Not really. There are problems with acpi-cpufreq without that case too.
> > 
> > > I wonder how you run into "cpufreq is initialized with offlined cpus"
> > > case.
> > > I remember that there were problems, but it's nearly impossible to run
> > > into this if the cpufreq driver is loaded early at boot.
> > 
> > I always thought there is a way not to boot all cpus by passing stuff in
> > command line and so this is a easy case to reproduce.
> 
> I am pretty sure cpuidle states won't initialize and in best case you never
> get them working on the offlined cpus.
> Local APICs won't be set up, ...
> 
> Such a parameter will never exist for x86.
I take that back.
CPU hot-add (even if CPU is not present at boot time) works.
I looked at C-states for that some time ago and it should only work if
the hot-add event came in via ACPI events for CPUs which were not
initialized at boot time. Better would be to initialize the first time it
gets switched online.
Anyway, making such stuff (cpufreq/cpuidle/...) more robust,
is certainly a good idea.

...
> And powernow-k8 driver is broken.
> The others are not tested that often, I expect they broke as well, right?
And powernow-k8 does not exist anymore..., fortunately I didn't have to
look at this stuff for some time.

... 
> Sorry, I cannot look into this due to lack of time,...


       Thomas

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
