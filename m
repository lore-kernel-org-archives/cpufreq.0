From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Fri, 22 Mar 2013 14:04:09 +0000 (UTC)
Message-ID: <20130322140409.C012F11FB81@bugzilla.kernel.org>
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





--- Comment #22 from Thomas Renninger <trenn@suse.de>  2013-03-22 14:04:09 ---
On Friday, March 22, 2013 07:13:33 PM Viresh Kumar wrote:
> Hi guys,
> 
> I will answer to questions of both of you in this mail.
> 
> On 22 March 2013 18:23, Thomas Renninger <trenn@suse.de> wrote:
> > Is this all to try to fix "cpufreq driver gets loaded while some cores
> > were set offline before"?
> 
> Not really. There are problems with acpi-cpufreq without that case too.
> 
> > I wonder how you run into "cpufreq is initialized with offlined cpus"
> > case.
> > I remember that there were problems, but it's nearly impossible to run
> > into this if the cpufreq driver is loaded early at boot.
> 
> I always thought there is a way not to boot all cpus by passing stuff in
> command line and so this is a easy case to reproduce.
I am pretty sure cpuidle states won't initialize and in best case you never
get them working on the offlined cpus.
Local APICs won't be set up, ...

Such a parameter will never exist for x86.

> > cpufreq_add_dev() and friends are complicated.
> 
> Not anymore, they are hugely simplified now.
They were hugely simplified and things are not working anymore and you
do not know why...

> > Those init functions got split some time ago and there also slipped
> > in a bug even it was simple splitting of functions.
> > 
> > I do not have time to look at fcf8058296edbc3de43adf095824fc32b067b9f8
> > right now. Don't know how much other stuff depends on it and how
> > sever it is on ARM that cpufreq does not correctly initialize with
> > offlined
> > cpus..., I would revert this patch.
> 
> Let me clear it to everybody. There isn't/shouldn't be a bug in cpufreq
> core, its just that acpi-cpufreq driver isn't adapted well with the changes
> related to affected_cpus and related_cpus.
And powernow-k8 driver is broken.
The others are not tested that often, I expect they broke as well, right?

> I have never gone into coding for any non-ARM platform and am really not
> aware of acpi-cpufreq driver and its users. That's why i told everybody
> where the issue is, and they just need to fix acpi-cpufreq driver with
> right values of policy->cpus (affected_cpus) and everything else would work
> after that.

Sorry, I cannot look into this due to lack of time, but I remember that
there were reasons why cpufreq_add_dev() was complicated.
Or that it's really easy to mess it up and it's not easy to fix it again.

     Thomas

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
