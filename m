From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH linux-pm] cpufreq: governors: Fix calculation of wall time
 in get_cpu_idle_time
Date: Fri, 22 Mar 2013 17:09:51 +0530
Message-ID: <CAOh2x=kwt918pdOMDYAVB7qEP2o57cnKH8AR6p_gwHOgc0AywA@mail.gmail.com>
References: <514C0555.1010806@semaphore.gr>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=32IP4pipgtmI4pUnImQDluL9AqwvR4lb3Cun6Oz5d+o=;
        b=qtBTymKVS02q2Ryt+hFmw++gkWnO3OfsSPuTnXuJLlkaIYImtbtYxLdwZozG5AWfJ+
         yJsfpy+ab/X3pWemcO5zD6hNwIX8CbwbtxmtxCEoxC0I/HtqY4L7mb5cK3dzRjWKkWZI
         MejYvH4uZPXaXDAwVz3BkfgBxSlKOktc/4noVi+9cDKis9x8BEavd9GRh+IeaX21Xbvn
         0uPKBcsUtBAW5YurSKv+AL2uDtVqUYRN8fgJGD3FzYs/8e61kcGHvDNsx/Amk5PvtQxT
         X/atPLhPVq5LSZycE2/fRs5539XoTVYUBdoUPiki8ditqy8aEUx1xskdWPvBSC0jmbb2
         ya3Q==
In-Reply-To: <514C0555.1010806@semaphore.gr>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stratos Karafotis <stratosk@semaphore.gr>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Mar 22, 2013 at 12:46 PM, Stratos Karafotis
<stratosk@semaphore.gr> wrote:
> With commit 8755a8ae31ba213db196324011a0da2a85807f25 the wall in
> get_cpu_idle_time is not calculated, when we use ondemand with
> io_is_busy = 1, preventing the CPU to increase to max frequency.
>
> Properly, calculate wall time when we use io_is_busy.
>
> Signed-off-by: Stratos Karafotis <stratosk@semaphore.gr>
> ---
>  drivers/cpufreq/cpufreq_governor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/cpufreq/cpufreq_governor.c b/drivers/cpufreq/cpufreq_governor.c
> index b49d45d..41e5e56 100644
> --- a/drivers/cpufreq/cpufreq_governor.c
> +++ b/drivers/cpufreq/cpufreq_governor.c
> @@ -53,7 +53,7 @@ static inline u64 get_cpu_idle_time_jiffy(unsigned int cpu, u64 *wall)
>
>  u64 get_cpu_idle_time(unsigned int cpu, u64 *wall, int io_busy)
>  {
> -       u64 idle_time = get_cpu_idle_time_us(cpu, NULL);
> +       u64 idle_time = get_cpu_idle_time_us(cpu, io_busy ? wall : NULL);
>
>         if (idle_time == -1ULL)
>                 return get_cpu_idle_time_jiffy(cpu, wall);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
