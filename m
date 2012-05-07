From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 16436] ath5k (AR5001) does not work after resume and fails with
 "ath5k phy0: gain calibration timeout"
Date: Mon, 7 May 2012 21:54:24 GMT
Message-ID: <201205072154.q47LsO1K025351@bugzilla.kernel.org>
References: <bug-16436-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-16436-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=16436





--- Comment #41 from Stoian Ivanov <sdr@mail.bg>  2012-05-07 21:54:22 ---
Created an attachment (id=73219)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=73219)
The problem is still there for Linux 3.3.4

This is a grep from my message log done with 

tail -n 80000 /var/log/messages | fgrep -a -e 'ath5k' -e 'May  6 06:18:28' -e
'syslog-ng starting up'  | head -n 1300  > ath5k.log

it shows that the problem is still there for Linux 3.3.4

this is a desktop install no suspend/resume features enabled just cpufreq
infrastructure

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
