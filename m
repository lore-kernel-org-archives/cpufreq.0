From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58761] related_cpus truncated with acpi-cpufreq driver on
 kernel 3.9.3
Date: Thu, 30 May 2013 16:00:09 +0000 (UTC)
Message-ID: <20130530160009.DB82F11F976@bugzilla.kernel.org>
References: <bug-58761-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-58761-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=58761





--- Comment #11 from Jean-Philippe Halimi <jean-philippe.halimi@exascale-computing.eu>  2013-05-30 16:00:09 ---

> You need to check the latest ones:
> 
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/cpu-freq/user-guide.txt?id=refs/tags/v3.9

Thanks for the link, I didn't know the other one was outdated

> Why I removed it was: "Nobody is making use of this information and was turning
> out to be more misleading".. As "hardware" for kernel is whatever is present
> below kernel layer.. So, if the layers below linux don't want to hide that
> information, let it be.

I have actually been using these files for while for a project related with
energy in order to decide which cores have a physical correlation with respect
to frequency transition. So if I get it right, it is not possible to have such
information anymore.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
