From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 56101] Intel Core2 Duo E6600 reports max-frequency of just 900
 MHz instead of 2.4 GHz
Date: Fri,  5 Apr 2013 14:14:25 +0000 (UTC)
Message-ID: <20130405141425.558B711FB79@bugzilla.kernel.org>
References: <bug-56101-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-56101-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=56101





--- Comment #11 from S. Kalteis <spam@kernelspace.de>  2013-04-05 14:14:25 ---
(In reply to comment #8)
> You can use
> cpupower monitor
> tool (sources located in the kernel, depending on the distribution it might
> have another name, which should get addressed by distro maintainers, there
> should be a separate cpupower package on Linux distros).
> This will show you the exact frequency your cores run on over a certain amount
> of time (or workload if a command is appended) including boosting.

cpupower monitor (from kernel 3.8.5) exits after printing the following output:

     |Mperf               
CPU | C0   | Cx   | Freq 
   0|******|******|******
   1|******|******|******


instead of running continously, I guess.

cpupower monitor -l gives:

Monitor "Mperf" (3 states) - Might overflow after 922000000 s
C0      [T] -> Processor Core not idle
Cx      [T] -> Processor Core in an idle state
Freq    [T] -> Average Frequency (including boost) in MHz


For the acpi-tables, see attachments.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
