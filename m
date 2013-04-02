From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 56071] Ondemand doesn't set correct low frequency
Date: Tue,  2 Apr 2013 06:16:01 +0000 (UTC)
Message-ID: <20130402061601.9591411F9F4@bugzilla.kernel.org>
References: <bug-56071-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-56071-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=56071





--- Comment #4 from Francescodario Cuzzocrea <bosconovic@gmail.com>  2013-04-02 06:16:01 ---
Hi and thank you for your reply !
Yes, my cpufreqdriver gave the min freq possible to 1.3 GHz, but according to
my CPU specs should be 900 MHz. I've no idea of why this happen, I've tried
everything I can do, like switch to userspace governor and se frequencies by
myself, or set those frequencies in /etc/default/cpupower but nothing worked, I
always get minumum frequency as 1.30 Ghz.

I bought this laptop in December, and this always happened, I've tried 3.5
branch, 3.6 branch, 3.7 branch and 3.8 branch. Now I'm on 3.9rc4.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
