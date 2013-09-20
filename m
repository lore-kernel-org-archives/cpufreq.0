From: Yinghai Lu <yinghai@kernel.org>
Subject: Re: [PATCH] cpufreq: return EEXIST instead of EBUSY for second registering
Date: Fri, 20 Sep 2013 12:30:19 -0700
Message-ID: <CAE9FiQUDwkQOt+rO8vbJW6hv3swP1n5kP3dT_rESoWUj5G6ANw@mail.gmail.com>
References: <1379563520-7221-1-git-send-email-yinghai@kernel.org>
	<CAKohpom-3orEns00DC2=uk4pgV_xnfRpM1hrdyK9pjPUEgBXrA@mail.gmail.com>
	<CAE9FiQU5PD4asdE3=sBSnLK8fwPT8vK81FAOuYtAWj_3ruyS0g@mail.gmail.com>
	<3290463.fBbGMovmdx@vostro.rjw.lan>
	<CAE9FiQWm=Db4e8nYdVJzpirmV2EfKxEYYRHo6ggTtX0CY3-hhg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=5cWIv4nvDg8yPpxYctw2Kn6482SUFW+lCecYjuK2x5E=;
        b=ISWhCSz+AYagn+VKlJqGnt9WEn/MUen50aIbcz+Z3DeyurPNEycF+D/veZl8Js7gZu
         edfa67jw0eAI3zfiptcGkOlFJT6E5kKtX/sHbBRSlDHif/VcnhWgEg8PVKZax+SGkIo6
         8ooczOk7O7vF8cVVGXM4k0YZq3dexmwyQ0GMN2IBxZq6qEqAL1hNG4MX13ryrXfVAmg+
         n3TzbPvZzottJEU3rC0p0yRaAG0vxobN1ajt6cRTmrbMPg89ykdBgSUdacv/jm7VZJr2
         Ocx5kdFbZrA3f6GbLWXAr3hz/d0cQYaTNmOFV3oOPIilDBRitC1nekdb8YuGEXC+3nlj
         7S5w==
In-Reply-To: <CAE9FiQWm=Db4e8nYdVJzpirmV2EfKxEYYRHo6ggTtX0CY3-hhg@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Sep 20, 2013 at 10:12 AM, Yinghai Lu <yinghai@kernel.org> wrote:
>>
>> I *think* we can just drop the module requesting stuff entirely, because it
>> doesn't seem to work anyway and udev is handling this for us.
>
Yes. looks like acpi_processor_load_module() is not needed.
udev will do the work.
