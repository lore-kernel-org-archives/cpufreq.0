From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64261] Intel Pstate driver truncates to pstate instead of
 rounding to nearest pstate
Date: Tue, 05 Nov 2013 01:28:23 +0000
Message-ID: <bug-64261-12968-PlbFZa8t4T@https.bugzilla.kernel.org/>
References: <bug-64261-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-64261-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64261

--- Comment #6 from Dirk Brandewie <dirk.brandewie@gmail.com> ---
(In reply to Doug Smythies from comment #5)
> Hi Dirk,
> 
> There are cases, i.e. when investigating error in load averages where one
> wants to lock the CPU at whatever frequency. I realize it was not the goal
> of intel_pstate, but still needs to be allowed for.

It is allowed for clearly you are using the mechanism.  The percentage values
to get to a given frequency are SKU dependent.  We could change it to make
your graph look the way you want it on your system.  Then someone else comes up
and say it goes to the higher P state too soon on their system.

In the normal case where intel_pstate is being used to save enrgy being
conservative is a good thing.

If you can't get to a selected (measured) frequency with the current interface
then that is a bug.


> Regardless, I am merely
> using this as a way to easily demonstrate the issue.
> 
> ".53 * 34 = 18.03 (so we are off by 3 percent of a pstate due to truncation)"
> No, I am arguing that it is off by 103 percent of a pstate due to truncation.

int(.53 * 34 + 0.5) = 18

How is it off by a whole P state?
> 
> I am also arguing that if rounding is used there will never be more than a
> half of a pstate discrepancy between desired and actual instead of 1 pstate.
> I am also arguing that it will help at the 100% end, where right now it
> might struggle to get to 100% on some processors.
> 
> For your examples, I am saying it should be:
> 
> Turbo:
> int(.42 * 38 + 0.5) = 16
> int(.43 * 38 + 0.5) = 16
> int(.44 * 38 + 0.5) = 17
> int(.45 * 38 + 0.5) = 17
> 
> Turbo off:
> int(.50 * 34 + 0.5) = 17
> int(.51 * 34 + 0.5) = 17
> int(.52 * 34 + 0.5) = 18
> int(.53 * 34 + 0.5) = 18

-- 
You are receiving this mail because:
You are the assignee for the bug.
