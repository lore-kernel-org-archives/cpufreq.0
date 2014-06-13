From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77771] Intel P-State: Constantly changing CPU frequencies on
 idle system.
Date: Fri, 13 Jun 2014 06:20:56 +0000
Message-ID: <bug-77771-12968-ZDM0skdXKy@https.bugzilla.kernel.org/>
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

Doug Smythies <dsmythies@telus.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dsmythies@telus.net

--- Comment #1 from Doug Smythies <dsmythies@telus.net> ---
Please define "an idle system". I ask because an "idle" linux server computer
can be quite different than and "idle" linux computer with some sort of gui
desktop, the latter being, in reality, actually considerably less "idle".

That being said, your frequencies do seem a little high now. Your previous
frequencies were unduly being forced low and there was a change with respect to
that issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.
