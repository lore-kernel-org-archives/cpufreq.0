From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 72361] AMD APU reset infinite
Date: Sun, 25 May 2014 13:29:45 +0000
Message-ID: <bug-72361-12968-axlrCNHHcx@https.bugzilla.kernel.org/>
References: <bug-72361-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-72361-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=72361

--- Comment #5 from ArLi Weng <arliweng@gmail.com> ---
i confirm, radeon.dpm=0 on 3.13.6 and 3.14.3 work fine.

-- 
You are receiving this mail because:
You are the assignee for the bug.
