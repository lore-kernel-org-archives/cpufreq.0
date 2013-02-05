From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 0/2] cpufreq: cpufreq_driver_lock is hot on large systems
Date: Tue, 5 Feb 2013 15:28:30 +0530
Message-ID: <CAOh2x=mWc9rBX3O_1NSr23TAWFtRA6BNW3TZ8FhZOMdH_0dmzQ@mail.gmail.com>
References: <1360017913-25667-1-git-send-email-nzimmer@sgi.com>
	<2765418.Ft0GYkgNgL@vostro.rjw.lan>
	<CAOh2x=n+ASeLpGHexxDvPGrN6ia+bLnNUNCb-covGDoABVk_wQ@mail.gmail.com>
	<3480441.gCEh0J5edK@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=FTDjWAkuYxuMpEFkK1lTcXjcS2jDOBE8ApTpJf499t8=;
        b=YWBgm7/Y2nnpPz9bvmXRSxSF/X2v5hWZJTkATFxx4qoqWhhxfS7JiIGEteAE/TzZkC
         OpP77oW7VD+KUOApDhc98583yeBZTik+Vi4TfhyKu8v4bTB8PYFb4rIQ1ox4SyV/RjOA
         LfOvNd9M+ihHMNwm4bCv25wOh4QRLqm32UNnem2zzoGeWTEyEzW1mBn4wqMa6Wml/CVQ
         ho+YOPX20nxpZwBUcN2KgeSykCthIIsGxqclKymkWv73tqLbev97NsixHKXq8RASPdHb
         YLjylWjlytmPg2fOrfpBhOZkl7dkYUlGydU14BrcspJncgi7bEKcw1GpLm5LcONIJPYH
         wIkA==
In-Reply-To: <3480441.gCEh0J5edK@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Nathan Zimmer <nzimmer@sgi.com>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, linaro-dev@lists.linaro.org

On Tue, Feb 5, 2013 at 3:33 PM, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> I actually don't agree with that, becuase the Nathan's apprach shows the
> reasoning that leads to the RCU introduction quite clearly.  So if you
> don't have technical problems with the patchset, I'm going to take it as is.

Great!!

Okay.. I don't have any technical problems with it, i reviewed most of it
carefully. The only pending thing is rebase on linux-next, after that i can
give my ack for it.
