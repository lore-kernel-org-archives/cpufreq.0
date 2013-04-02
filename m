From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 56071] Ondemand doesn't set correct low frequency
Date: Tue,  2 Apr 2013 05:23:06 +0000 (UTC)
Message-ID: <20130402052306.1563511FB79@bugzilla.kernel.org>
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





--- Comment #3 from Viresh Kumar <viresh.kumar@linaro.org>  2013-04-02 05:23:05 ---
On Tue, Apr 2, 2013 at 1:42 AM,  <bugzilla-daemon@bugzilla.kernel.org> wrote:
> I've a samsung NP535U3C, powered by AMD A6-4455M APU. Cpupower tells to me that
> the lower frequency reachable by my CPU is 900 MHz but ondemand governor switch
> only between 1.3 and 2.1 GHz and not between 900 MHz and 2.1GHz as it should
> be. I've also tried to set userspace governor to work between those frequencies
> but didn't work. Attached there is my cpupower frequency-info output. Thank
> you.

Your command gives you:

limiti hardware: 1.30 GHz - 2.10 GHz

I can make out from the above that your cpufreq driver gave min freq possible
as
1.3 GHz.

Borislav/Thomas,

You have any idea about why this can happen?

Francescodario, BTW you have any idea  from what kernel version this happened?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
