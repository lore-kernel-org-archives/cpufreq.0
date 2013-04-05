From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 56101] Intel Core2 Duo E6600 reports max-frequency of just 900
 MHz instead of 2.4 GHz
Date: Fri,  5 Apr 2013 12:54:46 +0000 (UTC)
Message-ID: <20130405125446.BAA3411FB5C@bugzilla.kernel.org>
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





--- Comment #7 from S. Kalteis <spam@kernelspace.de>  2013-04-05 12:54:46 ---
Hmm... this really might be related to only *reporting* wrong frequencies but
not actually *clocking* at 900 MHz.

I did a couple of tests using UnixBench 5.1.3 on kernel 3.8.5 with acpi-cpufreq
loaded (reporting a max of 900 MHz) and with Enhanced SpeedStep switched off in
BIOS settings (thus supposedly running at full clock speed of 2.4 GHz).

In both cases reported benchmark numbers are relatively close at about 830 to
880 (SpeedStep off = faster) points for single-threaded passes and 1430 to 1490
(SpeedStep on = faster) for two parallel tests.
I guess if the Core2 Duo really were throttled at 900 MHz, the numbers with the
cpufreq-driver loaded should be dramatically lower (though this is speculation
on my part).

Maybe this helps clear up things...

Thanks,

Simon

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
