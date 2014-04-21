From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Another powernow-k6 bug
Date: Mon, 21 Apr 2014 11:03:04 +0530
Message-ID: <CAOh2x=ndnFUBphVYGRL+x2jra36VS1T_F=sMpkAgm9xi52Qvvg@mail.gmail.com>
References: <1397676206.5717.7.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=OPjsXjAvwFY8BaFHeqZ5hiJWkYLz86L8YgwkW7Amj4Y=;
        b=B3zJJhsOEut9nL+WH+uRTGtVvse50/9x+mf88okg1RKfni/5FaRiN/R+Oc+KX/eq41
         yMk/00rcYN/Rj7zCFCNaTOcR1xWBrwy2SLgYl7+7y6TVY+/fWn382K86Mp0Uh9YLVPpt
         ViSAEbkBBHTgLmHR27sx4JNOoVnkkpj3ugsAIZt7jNaOPqUSA+qug7ZAfPg7HRZLmokg
         g8gOEhaWIAgj/K1Dk1hmaxzvv20o+9jxUAasK4ur3YqY6hAluScP+yj/QhQ9lzA28KpX
         Z98Hceoip8WU9hdfFlHCgoZCT3lFd3SbLZUuGf3zmnHPVyG3ktffI5PCl+a0RTW4RPHc
         Kkfg==
In-Reply-To: <1397676206.5717.7.camel@deadeye.wl.decadent.org.uk>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Mikulas Patocka <mpatocka@redhat.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On Thu, Apr 17, 2014 at 12:53 AM, Ben Hutchings <ben@decadent.org.uk> wrote:
> While looking at your recent powernow-k6 fixes (thanks for those), I
> noticed that powernow_k6_cpu_exit() doesn't work properly:
>
> static int powernow_k6_cpu_exit(struct cpufreq_policy *policy)
> {
>         unsigned int i;
>         for (i = 0; i < 8; i++) {
>                 if (i == max_multiplier)
>                         powernow_k6_set_state(i);
>         }

Yeah, there is a issue there. But why do we need to set freq to
highest freq on exit()? Probably this code can be simply removed?

>         cpufreq_frequency_table_put_attr(policy->cpu);

This doesn't exist anymore in latest sources.

>         return 0;
> }
>
> As max_multiplier is the actual multiplier * 10, this will never change
> the state.  I'm guessing this should be something like:
>
>         for (i = 0; (clock_ratio[i].frequency != CPUFREQ_TABLE_END); i++)
>                 if (clock_ratio[i].driver_data == max_multiplier)

--
viresh
