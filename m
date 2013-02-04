From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 0/4] CPUFreq: Implement per policy instances of governors
Date: Mon, 4 Feb 2013 14:04:03 +0100
Message-ID: <20130204130403.GD13909@pd.tnic>
References: <cover.1359976493.git.viresh.kumar@linaro.org>
 <5808458.pvV2iHpBWm@vostro.rjw.lan>
 <CAKohpok7RiJ_HKGi3r0vU26kNEtFKq==pMMoshT6Z2yy9ghemA@mail.gmail.com>
 <20130204123221.GA22340@pd.tnic>
 <CAKohpomcrtV3i9fL4zV6Mt0uDza-9pHTOsqTe2=C1t6mE6cpCQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1359983052; bh=id3mwjrVWgZEr6YMJLByewydB71OJjC6IqIyP0UPF7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=RQqUQjGQONyEeXpOnv1IDsyj/3FoGLUIF8Mw2u
	C2Notp8W1nGF0Z0hgcLUj2wd4eyfRl76frS5nV+DWYMnoK/3xQJsgT0XfLoMIvn8gO2
	ssjYqb/1rKNBROMi6j4bPjhtO7G9dS7JTi2pqVlwLvGaH1ZnQW7LwMb5OISERSsnao=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1359983051; bh=id3mwjrVWgZEr6YMJLByewydB71OJjC6IqIyP0UPF7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=ZMNU6l/iv1USYzpFGZCzIR6SocSiBI8vb+UaY4
	eHDzTMzJl58BMahNAl8uI2cancDsq8cravr+OP4Jw1l6tq5q0FLNw5rYL9AoZCk8/NJ
	mY5+efEi28zxC87m//WWDXv5x2rkZrqPCIykqHGhbywWeR8iH0yKIoLncKHlPUp1gg=
Content-Disposition: inline
In-Reply-To: <CAKohpomcrtV3i9fL4zV6Mt0uDza-9pHTOsqTe2=C1t6mE6cpCQ@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com

On Mon, Feb 04, 2013 at 06:24:19PM +0530, Viresh Kumar wrote:
> That's why i am highlighting it again and again. :)

Ah, see, someone caught up with it :).

> What i believe is, the place where this directory was present earlier
> (cpu/cpufreq/) wasn't the right place. Everything else was in cpu/cpu*/cpufreq,
> then why this in cpu/cpufreq/ ?

For the simple reason that the "cpu*" stuff is per-cpu - the
"cpu/cpufreq" is per system, i.e. one governor for the whole system.

> I don't know how much of a pain it would be to fix userspace for it,
> but i know it wouldn't be that small.

I wouldn't fix userspace but simply not touch it. You can add your
per-policy stuff in "cpu/cpu*" as new sysfs nodes and no need to
change anything. And, also, as I suggested earlier, you should make it
configurable since this code wouldn't make sense on x86, for example,
where one system-wide governor should suffice.

> I had another idea of doing this only for platforms where we have
> multiple struct policy alive at the same time. But didn't wanted to
> implement it before discussing this further.

Simply put it behind a config option like
CONFIG_CPU_IDLE_MULTIPLE_DRIVERS, call the whole menu
"Multi-power-domain-policy" something and that should be modulary
enough.

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
