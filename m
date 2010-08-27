From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 17001] ondemand governor non-functional / ACPI P-states driver
Date: Fri, 27 Aug 2010 12:24:19 GMT
Message-ID: <201008271224.o7RCOJna028360@demeter1.kernel.org>
References: <bug-17001-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-17001-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=17001





--- Comment #7 from Peter Ganzhorn <peter.ganzhorn@googlemail.com>  2010-08-27 12:24:17 ---
Created an attachment (id=28121)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=28121)
dmesg with cpufreq.debug=7

cat /dev/zero >/dev/null &
cat /dev/zero >/dev/null &
sleep 10
dmesg > /data/dmesg0.txt
killall cat

dmesg output after reboot and running above commands. Frequency did not
increase while CPU was at reported 100% load.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
