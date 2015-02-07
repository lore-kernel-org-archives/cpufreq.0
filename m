From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Delays, clocks, timers, hrtimers, etc
Date: Sat, 7 Feb 2015 09:51:35 +0000
Message-ID: <20150207095135.GB8656@n2100.arm.linux.org.uk>
References: <54C8E125.3070905@free.fr>
 <e028a4eb604a491f4438557f4a1373ef@agner.ch>
 <54D52F84.9050600@free.fr>
 <266c7b1ff2d1a8ba0ae4866f4fb4eca5@agner.ch>
 <54D576B1.4000001@free.fr>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=pandora-2014;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=qjinCg0+ZaJdowNfQH2cB9wREfpYKk3gTWHqf8sOzf0=;
	b=XhOI5Yw8tp4loDANZcdUPAaZTNCR3QFQ+FQPSLSg+LkVnS6ugLM3nUyVgHr68+s3sYXXDrhATkpAQR400DnV2M1F5Hq4BPXkJb+Gzh6bOgohIlQ+ABewG/oAWaM5xw8E4CKhMqVwaATus826Rekrcuh6YkWG7Hp58eEhFs8Qy3E=;
Content-Disposition: inline
In-Reply-To: <54D576B1.4000001@free.fr>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mason <mpeg.blue@free.fr>
Cc: Stefan Agner <stefan@agner.ch>, Mark Rutland <mark.rutland@arm.com>, Linux PM <linux-pm@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <rob.herring@calxeda.com>, cpufreq <cpufreq@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Fri, Feb 06, 2015 at 06:21:37PM -0800, Mason wrote:
> Also, reading arch/arm/kernel/smp_twd.c, I see that frequency changes
> due to cpufreq are properly accounted for. (Although I imagine they do
> introduce a small error in time-keeping because moving from freq_A to
> freq_B is not instantaneous, so the exact time elapsed in-between is
> impossible to determine.)

TWD is not used for time keeping as such.  As I explained in one of my
previous emails, local timers are used to signal events.

The active clocksource is used to determine the passing of time-of-day,
and sched_clock is used to account for process time by the scheduler.

An early/late/missed local timer interrupt has no impact on time keeping.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
