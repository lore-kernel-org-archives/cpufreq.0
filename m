From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: cpufreq cowork with scheduler
Date: Fri, 15 Mar 2013 14:30:44 +0530
Message-ID: <CAOh2x=kzkdG4x=huCr8kdrstbyyqWdt6ZsWUMPsvtR8y4D16Kg@mail.gmail.com>
References: <CADApbegvhzBC-sawW++0fmxtEr6nCx6QWtSzPAikvo3CR6_8Bg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=MsLdPaM8vUlzq6kxbAocnRpSrl9nryEjFL3heGmbdwo=;
        b=u7VZMhAdssaM9jPBZlW62fhqLCYZpD5AgvHDlqo+qJoxoiaFZ7g5U8Wf+yvUzf37g8
         /mL3Gi/gZ7/bYqwOfUCZQSGJ1kv7TBq1VJ90SpeuedNintmAiVuqZasETLZXHHdHE8/Z
         t7U/aG7Usj/T7/kswID0HHozq8jxKGVThIAlF8e3+dBBkBXZsF5hEnSRqd2wdNKhjxfn
         gtO4CXAjNRz02FoEQCjHJ7hsqx/ohsbptGCPFZYTo1Bq5pcM+cFL2x0VRqoxckcVMF+k
         dIrvHwSZojstyuUfiVtWqoHI97oLP+ZzKeFjsG5sflBRkz0V8DOBX2C+0izQ3J5jE8HU
         DeAQ==
In-Reply-To: <CADApbegvhzBC-sawW++0fmxtEr6nCx6QWtSzPAikvo3CR6_8Bg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chao Xie <xiechao.mail@gmail.com>
Cc: cpufreq@vger.kernel.org, linaro-kernel@lists.linaro.org

On Fri, Mar 15, 2013 at 11:54 AM, Chao Xie <xiechao.mail@gmail.com> wrote:
> hi
> It may be a old topic.
> Now the cpufreq governors will sample for system work load. The
> schduler knows about the current workload of each cores. So why not
> make use of it? The sampling need take some time, so when the cpufreq
> increase the frequency , the system has been busy for a period of
> time. Making use of the schduler information can reduce time spending
> at sampling.

Hi Chao,

I am working for Linaro Power Management Working Group and we know
about this problem or solution. We have a dedicated blueprint towards this
goal:

https://blueprints.launchpad.net/linaro-big-little-system/+spec/sched-cooperation-with-dvfs-and-idling

--
viresh
