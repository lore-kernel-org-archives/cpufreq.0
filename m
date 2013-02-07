From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 0/5] Add P state driver for Intel Core Processors
Date: Thu, 7 Feb 2013 19:32:26 +0530
Message-ID: <CAOh2x=mJY+NcTMFNDVTWU92EDXBU_ixNeEur6-tj-XOTy46gRQ@mail.gmail.com>
References: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
	<CAOh2x==-u_AuyG34t0cg6BURsj3rU4rwSgZaSbX4ULU7ztdxMg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=jV0bOnaaxXXK2DrlopBOdFdXm/I7K+/QM1ZTdaf6FfE=;
        b=bitGaZHfhGB001sfR/6SzA0SzmCgRpDmZAWHBTdVj1gcWa9cSyEiQZzbpb0ZDnHE1M
         jFuJQizJHGrordr2/SP2UqMCIeKiEWwyqjfgWCmUOHzqq+XeNTPzLV2luh7IjX8BMAn/
         hIEgFKE9UtkX007P70pZM8nX3iLpDWsstbfly76vx/FS5+7nblMtfOq0tDZmmU/DnMnE
         a9Z9vjQ6FYl3kmTmo6XNXo9vClBKo0h6rG2rfIbzg6lx271/XFOQGXNiMpQiVqEo0f91
         84VvpHIXcWMWTVQPsutqN3+BXtE1UE69mccGu7IJcDmy35u0K/m/eQCVSUJs9gsww4TH
         RyDg==
In-Reply-To: <CAOh2x==-u_AuyG34t0cg6BURsj3rU4rwSgZaSbX4ULU7ztdxMg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com, "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>

On Thu, Feb 7, 2013 at 4:12 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> @Rafael: I wasn't sure if these would apply over my patches without any
> conflicts and so i applied them in my repo. Added my Acked-by's and fixed
> a minor thing in one of the patches (as mentioned in the other mail).
>
> You can pick these from: dirk-patches
>
> http://git.linaro.org/gitweb?p=people/vireshk/linux.git;a=shortlog;h=refs/heads/dirk-patches

Hi Rafael,

I have got few sparse fixes for these patches. Updated the branch,
please pick it up again.
