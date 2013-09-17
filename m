From: karthik vm <meetvm@gmail.com>
Subject: Re: Few clarifications on DVFS
Date: Mon, 16 Sep 2013 22:13:11 -0400
Message-ID: <CAOuKo4kZNv70OyEt6tRynfFmRex8DW+nJCg2pZGPoydnHn+LaA@mail.gmail.com>
References: <CAOuKo4nZ5Yij3cnM=PuMR3awJ2QAbY4O+-mKi110xfc66xyWUg@mail.gmail.com>
 <CAOh2x=n3PVMJhbrJE33Qe73=6ZUhh8yR1rs+ziWTD5tFNjW6RA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=9c0OUpjY+rukrwlHVOBaprCfSj6yoZotSP9zPnOPHqk=;
        b=dNVk7MJVOkQyCMlJpbp4xqsw3qY6CLBn6+fryiJUxAwHteKElX1F0H6+vienNnjIIu
         lHlEea7kX3It6DxFkB3lQ2Fr6I8M/5VKVBGprT8gt0pxo4g1l3Ezk40z9kp3seZlI/Zq
         GGdWcEE9864CeZ+5HggoFo8C0JqAyQWol4sC65idNWAv0vLWjOxMFDXX5YPUgEkqxmyY
         /pae32gxa/8jbS9ym/akDYy4LBgjJWpo4jlhC4eNgb3pTipxVxJoX17h3jg2Sbi+5F+S
         K20DQgwKAdGafJ08lfRwyVIDyLFc2wAdANup6ZQi2T+A1EekZopgFWGMZy4dPvkBuQQF
         Ichg==
In-Reply-To: <CAOh2x=n3PVMJhbrJE33Qe73=6ZUhh8yR1rs+ziWTD5tFNjW6RA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>

Thanks for immediate response Viresh.

On Mon, Sep 16, 2013 at 1:46 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:

> What's the problem you see in OS doing that? Its not about the guarantee
> that OS can change freq in that time, but is more about hardware... And
> so it doesn't matter who changes it..

Yeah actually that is what my concern is. It seems that for changing
the frequency we need to acquire a lock (in cpufreq_driver_target()).
Hence even though the hardware is capable of ns level DVFS, OS
overhead may be large enough to take advantage of it. Can we measure
this overhead?

> Ya, the API is open to be called from anywhere you want... but then its
> your hardware and you must know what you are doing :)

Great to know. Thanks!!
