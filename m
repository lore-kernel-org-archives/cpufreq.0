From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: v3.13.5 intel_pstate: cpufreq: __cpufreq_add_dev: ->get() failed
Date: Wed, 12 Mar 2014 13:25:17 +0800
Message-ID: <CAOh2x=mCs_C-g3fkeQic6g4hayaHyYMeAe7sXEFAhnL9gtyNEA@mail.gmail.com>
References: <CAA7pwKNmosWaWPR0x3kNzL7eNLk8vdCB=NknU9ayLT9s1fJQYA@mail.gmail.com>
	<531F6F50.1040209@gmail.com>
	<27921269.0Ejuc8iDoo@vostro.rjw.lan>
	<1679162.yVRSrpzkOW@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=3+jnrX3O+tZPcIxrNYDp6Peh009cfMeHVzCkoXP4SoI=;
        b=O1Xc31xuOKDAJ9cBqU2l6f8ThwSjWpv+MOInMt9VI874vkaqe6TTCzHG2pKdfvbAq2
         0ppOsjDk91KHUA6AYWT/i7+fZ7/+DmYO0Yg6+9avgHHLhW0cv1sljsgt++0aQ+aJN6Yz
         DKfV49cLhcB/1hEORub/E0epTCNIo4pgB9KEVxoAuy0OMoK/p6b284Yfg4CedHyfF02E
         Hb9dZwy5i/+nOZO8yrBEqB5sHOldDFS7QNIhU+GvCvHNoKaeudYn8e/8bi5gqjeyMobh
         VgnzCjI0dHXGa5Ne7+vp587h6vXAe8rFZkesIcBLyllXVdKvgRbJhv+jQGHY/SLkc7G+
         0vHQ==
In-Reply-To: <1679162.yVRSrpzkOW@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, Patrik Lundquist <patrik.lundquist@gmail.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On Wed, Mar 12, 2014 at 4:57 AM, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
>> Well, ->setpolicy drivers are a special case anyway, so we can simply skip the
>> current frequency updates in __cpufreq_add_dev() and cpufreq_update_policy()
>> for them.
>
> In other words, we can do something like in the patch below I suppose?

I don't think its a good idea to handle ->setpolicy specially here.
Zero shouldn't
be allowed as a return value of any online CPU. And doesn't matter at all with
->setpolicy or ->target.
