From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 1/3] cpufreq: ondemand: Change the calculation of
 target frequency
Date: Thu, 13 Jun 2013 23:40:08 +0200
Message-ID: <20130613214007.GA32127@pd.tnic>
References: <q46r5iepl3sunqe5eemv66hk.1370694869222@email.android.com>
 <7661669.NhG4BEI8zO@vostro.rjw.lan>
 <51B64BC6.6040400@semaphore.gr>
 <16929930.1G36b4NkSe@vostro.rjw.lan>
 <51BA380A.1040009@semaphore.gr>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1371159609; bh=Sy0IibaEhIJET82n2JE8fekfUYIYUpuV/gUBFIrx8u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=Z15ORzTX2De7aRpR71CuMQwBkHhMirA7GNZfUz
	59cQwZOUBG8sPxgb0j1nK0FeXYYDfrC1vcPjQeOg+2OeOR5wGuv7xW3Kl6a+kZCrZzP
	6o0FIIgAnnIlMBKE/Y0vXnVZTg8MxuAj9mlzyZTIQApS8x06USIjRf4/o6KTJK2wCQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1371159609; bh=Sy0IibaEhIJET82n2JE8fekfUYIYUpuV/gUBFIrx8u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=Z15ORzTX2De7aRpR71CuMQwBkHhMirA7GNZfUz
	59cQwZOUBG8sPxgb0j1nK0FeXYYDfrC1vcPjQeOg+2OeOR5wGuv7xW3Kl6a+kZCrZzP
	6o0FIIgAnnIlMBKE/Y0vXnVZTg8MxuAj9mlzyZTIQApS8x06USIjRf4/o6KTJK2wCQ=
Content-Disposition: inline
In-Reply-To: <51BA380A.1040009@semaphore.gr>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stratos Karafotis <stratosk@semaphore.gr>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Borislav Petkov <bp@suse.de>, Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jun 14, 2013 at 12:22:18AM +0300, Stratos Karafotis wrote:
> Please let me share some more test results using aim9 benchmark suite:
> https://docs.google.com/spreadsheet/ccc?key=0AnMfNYUV1k0ddDdGdlJyUHpqT2xGY1lBOEt2UEVnNlE&usp=sharing
> 
> Each test was running for 10sec. 
> Total execution time with and without the patch was almost identical, which is
> expected since the tests in aim9 run for a specific period.
> The energy during the test run was increased by 0.43% with the patch.
> The performance was increased by 1.25% (average) with this patch.

Not bad. However, exec_test and fork_test are kinda unexpected with such
a high improvement percentage. Happen to have an explanation?

FWIW, if we don't find any serious perf/power regressions with
this patch, I'd say it is worth applying even solely for the code
simplification it brings.

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
