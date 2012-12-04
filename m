From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 50721] CPU freqs stay stuck at max after reboot with on-demand
 governor set - i7-2630QM
Date: Tue,  4 Dec 2012 01:01:43 +0000 (UTC)
Message-ID: <20121204010143.EEE5411F9DF@bugzilla.kernel.org>
References: <bug-50721-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-50721-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=50721





--- Comment #8 from rocko <rockorequin@hotmail.com>  2012-12-04 01:01:43 ---
Created an attachment (id=88361)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=88361)
turbostat after boot showing too-high GHz readings

This is still a problem in 3.7-rc8.

I ran turbostat (log attached) just after reboot, before the governor tried to
drop the frequency down to lowest (in fact the governor dropped to ondemand
just before the last reading in the log). Here turbostat also reports frequency
readings are also over my CPU's max of 2.0GHz (up to 2.6 GHz in some cases).
Does that mean that turbostat is also providing unreliable information? The
cores are definitely running at a higher frequency, because the fan goes on
high and the power usage is right up.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
