From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58761] related_cpus truncated with acpi-cpufreq driver on
 kernel 3.9.3
Date: Wed, 29 May 2013 15:26:03 +0000 (UTC)
Message-ID: <20130529152603.C67CC11FACF@bugzilla.kernel.org>
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





--- Comment #2 from Jean-Philippe Halimi <jean-philippe.halimi@exascale-computing.eu>  2013-05-29 15:26:03 ---
@Viresh Kumar: Alright, I get this. But my Intel(R) Core(TM) i7-3770 CPU @
3.40GHz (Ivy Bridge) cpu does have threads that share clock frequency domain.

Here are the results any older version (from 3.2.0 at least) of the kernel have
:
/sys/devices/system/cpu/cpu0/cpufreq/related_cpus: 0 1 2 3 4 5 6 7

Which means : Any thread within this set of threads physically apply the same
frequency.

In the 3.9.3 kernel version, I don't have this result anymore (see my previous
post), and I doubt the Linux kernel has changed any physical property of my
processor.

According to what you said in your post, is "shared clock line" different from
"shared frequency domain" ?

Thank you for your time

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
