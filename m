From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77771] Intel P-State: Constantly changing CPU frequencies on
 idle system.
Date: Sun, 15 Jun 2014 00:44:39 +0000
Message-ID: <bug-77771-12968-ORexCxlUdb@https.bugzilla.kernel.org/>
References: <bug-77771-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-77771-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=77771

--- Comment #4 from Doug Smythies <dsmythies@telus.net> ---
Created attachment 139771
  --> https://bugzilla.kernel.org/attachment.cgi?id=139771&action=edit
turbostat look at idle system

Perhaps provide the output from "turbostat sleep 60" or "turbostat -J sleep
60".
I have attached the result from my system, where my CPU's are all at low
frequency (lowest pstate). My system is a server with no GUI stuff.

I did it as an attachment rather than in-line, so as to (hopefully) not mess up
the formatting.

-- 
You are receiving this mail because:
You are the assignee for the bug.
