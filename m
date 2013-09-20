From: Yinghai Lu <yinghai@kernel.org>
Subject: Re: [PATCH] cpufreq: return EEXIST instead of EBUSY for second registering
Date: Fri, 20 Sep 2013 10:12:31 -0700
Message-ID: <CAE9FiQWm=Db4e8nYdVJzpirmV2EfKxEYYRHo6ggTtX0CY3-hhg@mail.gmail.com>
References: <1379563520-7221-1-git-send-email-yinghai@kernel.org>
	<CAKohpom-3orEns00DC2=uk4pgV_xnfRpM1hrdyK9pjPUEgBXrA@mail.gmail.com>
	<CAE9FiQU5PD4asdE3=sBSnLK8fwPT8vK81FAOuYtAWj_3ruyS0g@mail.gmail.com>
	<3290463.fBbGMovmdx@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=1EZcIYo4U4+c/HK7ns4I5U4ByGnno7r3o/gcf/3HZQc=;
        b=rMy3aMuGX9XKV5/asasAyO8IQIFL04/d1xr6BLrnC3qE+aQHmJxlMuFUVkZhMJs+Ki
         3FhxwacK7iCsO1sqcD49mQfxzF9HHsfsSL0SlNEAb802Hh7sZfxShwO8YRezY3Fbly8m
         m714tt7faoJPTfqGG0QWMbP1VdRGpfOdEGwQHltP1WkxfizoeJGBOWOfEt+eMo0WZ3Mr
         OOdmXxhjU1YNQg2chiD7P5IpESGB2ZYW9+n7f2A82NpOIpvFdaggR89FZKvRuXBEO5L+
         Mh0u2nQZ+m1YlKlVPt1T8tSBSiWyGarxMEkb+f0OtaolAEwB/sWsNsKlsjvizKzyYArq
         jCow==
In-Reply-To: <3290463.fBbGMovmdx@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Sep 20, 2013 at 6:30 AM, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> On Thursday, September 19, 2013 10:30:04 PM Yinghai Lu wrote:
>> On Thu, Sep 19, 2013 at 9:23 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>> > On 20 September 2013 07:01, Yinghai Lu <yinghai@kernel.org> wrote:
>> >> Sorry,  looks like this one is not enough.
>
> Well, I've already applied this one and it makes sense to me anyway.

you can keep that.

>
>> >> please let me know if you prefer me send addon patch
>> >> or revised one.
>> >
>> > Atleast you can let us know what the problem is? And then we
>> > can decide on that.. But anyway, you can send a new patch
>> > based over latest linux-next (which will have your original patch),
>> > and then leave it onto Rafael to merge it or have two patches..
>> > (though I am quite sure he will not drop anything now, unless its
>> > too screwed.., at worst he might revert it..)..
>>
>> looks like the crash is intermittent..., so i thought that patch fixed
>> the problem.
>> but later I found other suspicious print out.
>
> So, does it mean that the $subject patch fixes the issue for you to some
> extent, but more changes are necessary to make it go away completely?

yes.

>
>> please check new one:
>>
>> https://patchwork.kernel.org/patch/2915181/
>
> I see.
>
> I *think* we can just drop the module requesting stuff entirely, because it
> doesn't seem to work anyway and udev is handling this for us.

looks some nehalem/westmere based system may need it when they have
several SSDTs. will double check that.

Thanks

Yinghai
