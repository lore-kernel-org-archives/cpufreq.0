From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Sat, 14 Jun 2014 20:20:25 +0000
Message-ID: <bug-77201-12968-AyiigN2M8y@https.bugzilla.kernel.org/>
References: <bug-77201-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-77201-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=77201

--- Comment #80 from Mauro <registosites@hotmail.com> ---
Created attachment 139761
  --> https://bugzilla.kernel.org/attachment.cgi?id=139761&action=edit
Hang test script

I've made a small script to automate the test and reduce the chance of me
making some error.

I'm attaching this as a reference in case later I see some debug output on
screen that does not make it across the serial cable to the text log. Obviously
my echos with information do not get across the cable but help in checking
where things hang.

I forgot to mention before, the test with commit 3610fd8 from Viresh's tree
hangs at "Changing frequency to 1.8GHz" I don't see more output, the log
matches what I see on screen.

-- 
You are receiving this mail because:
You are the assignee for the bug.
