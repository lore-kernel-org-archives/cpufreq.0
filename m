From: Jonathan Nieder <jrnieder@gmail.com>
Subject: Re: [BUG?] Moving drivers to drivers/cpufreq/ causes all to be loaded
Date: Sat, 13 Aug 2011 14:02:46 -0500
Message-ID: <20110813190246.GA10412@elie.gateway.2wire.net>
References: <20110414094447.GA1611@n2100.arm.linux.org.uk>
 <alpine.LFD.2.00.1104211629300.24613@xanadu.home>
 <201104261605.26791.arnd@arndb.de>
 <201104261904.45923.rjw@sisk.pl>
 <20110426181508.GB1908@redhat.com>
 <20110813154638.GA1494@elie.gateway.2wire.net>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=5EJ6y7fLq782M5mnBQONdWa2z5IXMEBM+P2XiBMdJPo=;
        b=q58Pcq60qcL9yCMnMH/xn1kDc5n06VsL0KvMhkuV2m4FIQlQSse23iwWPw8p1Nv3Bp
         35LdPaXJ0tuB3bUpZOA7AhptwuAlt0opd6dan/bqar5XolmfMQOHEXfsFBFV5LVdJBXv
         3l9Za6hdAe31JolygdN9RfoQ7jxZ6zBfDXR6E=
Content-Disposition: inline
In-Reply-To: <20110813154638.GA1494@elie.gateway.2wire.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Nicolas Pitre <nicolas.pitre@linaro.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Mattia Dongili <malattia@debian.org>

Jonathan Nieder wrote:

>  (1) This is still incredibly fragile.  What *should* cpufrequtils
>      be doing to get the modules it needs?
>
>  (2) Using the 3.0 or later kernel with old userspace gives bad
>      results (e.g., 30% increase in power consumption for one
>      reporter).  That's a regression.

The "30% increase" part was an unrelated bug (i915.i915_enable_rc6=1
brings power consumption back to normal), for those who were
wondering. :)

Old userspace automatically loading the wrong cpufreq drivers still
does not seem great to me, though I don't have any great ideas about
how to prevent that (a separate drivers/cpufreq-drivers/ directory
does not sound too appealing).  I guess I'd be most interested in how
to fix (1) first.

Thanks,
Jonathan
