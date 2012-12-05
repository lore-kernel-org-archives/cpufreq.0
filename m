From: Arjan van de Ven <arjan@linux.intel.com>
Subject: Re: [PATCH RFC 0/1] cpufreq/x86: Add P-state driver for sandy bridge.
Date: Wed, 05 Dec 2012 13:01:27 -0800
Message-ID: <50BFB627.5080106@linux.intel.com>
References: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com> <50BFAE5A.1010809@verisign.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <50BFAE5A.1010809@verisign.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David C Niemi <dniemi@verisign.com>
Cc: dirk.brandewie@gmail.com, cpufreq@vger.kernel.org, rjw@sisk.pl, deneen.t.dock@intel.com

On 12/5/2012 12:28 PM, David C Niemi wrote:
>
> Dirk,
>
> I applaud the work you are doing.  In general I believe it is important to separate policy (governor and its settings) from the driver, particularly so as different end-users have very different goals for power management.  Not everyone is trying to maximize performance per watt per se (in fact probably rather few end users are doing so literally).  In server applications, for example, the first priority is typically maximum performance when under heavy load, and the second priority is minimum power consumption at idle.  There may not ever be a benefit for choosing one of the middle clock states.  The OnDemand governor with the sampling_down_factor set to ~100 can do quite well at this, at least compared to implementations prior to yours.  Another consideration is that just blindly tryin
 g to run flat out all the time (e.g. the old performance governor approach) bumps you up against your thermal limits and can actually slow you down, vs. intelligently powersaving idle hardware
> threads -- so a user who totally aims for performance with no regard for power savings cannot avoid must paying some attention to power management.
>

the idea that you can have separate policy and hardware is a big fallacy though.
A good policy ends up very hardware specific, and policies of the past work poorly on todays hardware
("ondemand" is one of the worst case behaviors you can have on modern Intel cpus for example).

While I appreciate the desire for some level of "preference" control, the split of policy and hardware in the
way cpufreq did that really isn't the way to go forward...

