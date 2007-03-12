From: "Joshua Justice" <joshj777@gmail.com>
Subject: Re: cpufreq on Debian, problems
Date: Mon, 12 Mar 2007 13:48:39 -0400
Message-ID: <553837380703121048ybaeb9ceqc146129adb2e5e03@mail.gmail.com>
References: <553837380703111304m4aea8cbcufdc5da4261e41895@mail.gmail.com>
	<45F47282.4020209@chrestomanci.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:references;
	b=L2SaF9r63Yfv/VJ/kAFt2FiLZvkaV/EU1/zTj/NYGCfrsLRLpFYjPcQkKHQn4UQg0xU+6wvZMp7XypnXQDwt0J4Yg65aGaEzfpIm24Tc06VSgHPPzNEf+bJsP3lgnwUqfXFz9IBJMOl1wC+kkuCbRfPu6DYKWw4WujX1Ud8molE=
In-Reply-To: <45F47282.4020209@chrestomanci.org>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Pottage <david@chrestomanci.org>
Cc: cpufreq@lists.linux.org.uk

On 3/11/07, David Pottage <david@chrestomanci.org> wrote:
>
> Take a look in
> /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors that
> they are there, then echo a govenor name into
> /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor



This may be my problem right here. There's no /cpufreq/ directory in my cpu0
and cpu1 directories.
I should have mentioned that I'm running on a laptop.
