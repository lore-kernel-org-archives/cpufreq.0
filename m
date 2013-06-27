From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Porting cpufreq module for memory frequency scaling 'memfreq'
Date: Thu, 27 Jun 2013 12:48:27 +0530
Message-ID: <CAOh2x=mJiJnsMzMLoyHxAbjEsS9erESeJTzbnUVSPk9iYnn15g@mail.gmail.com>
References: <CAMefCkCXyM4EV92Q==zScae7FzgD2VjmyGx2nTf_u2LK6b6hvQ@mail.gmail.com>
	<CAMefCkAwdGGeOrJWnkTdbFH8L453LC1Cvo7mh_Ntx0LBSwQv+g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=tJCVeBtpmkrIDoPpz1+flrgH6ynDr1pqNQaqF12Wg8I=;
        b=G6R3Bk452vEKGCLWCLp+GiXgyTR02FXjb2g1IBQeWwbVLVuZ6HZeoPPwoCQzfM+nFo
         ViAEZ9zqRu/dKDoUMQu6vxyQI/SsX8GZEW/vBIXHIHu66EKjU3iNMPQ+iRYCYzfLPEcd
         FR1s6inQzHQuc2fbrC09GVMmgwfrC1DOMUrdiSgwAA5TDTIluGiP5nMT4szEisk4SHOF
         D7TFTSOQBAxO2Z9WVWlWbNZdU7fA8nViLJdhiMPI2Cj4D0DCZT2KntwFofpr/aKKxgLG
         PvUXUAsNYr+1vNq4Jn74Jk7+gjH6DGw3FB7HgiGVKKVM1e0E1e83jiJMC8SnW+abErsN
         3Cpg==
In-Reply-To: <CAMefCkAwdGGeOrJWnkTdbFH8L453LC1Cvo7mh_Ntx0LBSwQv+g@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guru Prasad <gurupras@buffalo.edu>
Cc: cpufreq@vger.kernel.org

On Wed, Jun 26, 2013 at 9:28 PM, Guru Prasad <gurupras@buffalo.edu> wrote:
> I'm working with a hardware simulator - Gem5 (http://gem5.org). I have
> added some functionality to this simulator to modify memory frequency.
>
> I would like to add kernel support to manage memory frequency similar
> to how cpu frequency is currently maintained so that I can study the
> cost-benefit of memory frequency scaling.
>
> I copied all the generic cpufreq sources to a separate folder
> kernel_source/drivers/memfreq and setup the drivers/Makefile. I have
> also done the preliminary Kconfig modifications.
>
> A few things I don't follow are
>
> Where does the kernel actually implement the delay resulting from
> cpuinfo.transition_latency?
> Does the kernel stall for the duration of the delay?

This is the expected hardware latency for changing frequency and
not a delay that kernel will implement.

This will help in taking a decision to change freq, if its really worth or
not.

> the per_cpu macro        - I don't understand what this does..How can
> I implement the same for memory - which I'm considering as a shared
> resource rather than per_cpu.

This helps in creating an instance of variable per cpu... so if your system have
four cpus, we will have four variables with the same name :)

Just create a normal variable if you don't want per-cpu stuff.

> the subsys interface      - What does it do and how do I reproduce
> this for memory? Can I use the existing bus_type memory_subsys?
> (drivers/base/memory.c)

This helps in getting notifications when cpus are added/removed.

> sysfs interface              - Is there any place I can look to
> implement a nice sysfs interface similar to cpufreq?

cpufreq.
