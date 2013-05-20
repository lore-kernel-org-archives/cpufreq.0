From: Ross Lagerwall <rosslagerwall@gmail.com>
Subject: Re: NULL pointer dereference
Date: Mon, 20 May 2013 13:04:48 +0100
Message-ID: <20130520120448.GA1176@hobo.wolfson.cam.ac.uk>
References: <20130520070350.GA741@hobo.wolfson.cam.ac.uk>
 <CAOh2x=ms1j1j=qV2zkd_KQiwLGirPvwQkV=7b=gnbBR34TxKng@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=yBz8ugxUMCdi+9SBTN3wuBl3pHGZ2LXrAx+WMUQq/k4=;
        b=XcDSZdsp+b74YuXA0NT/R+rbpExdF9sPCN4y5PPffCc3lW62Qfml7pTg59B88gBRKl
         eSaeeRjZB3XUkd8Ty+aU01dZ7g7R1YDLEcKp1k5GlZcyV3OnoLHsd5XT0pqBTA/HjkoJ
         ARnSotGDKrRhYro18/QeFRUZ+HExUgBXM4D1ym7c1JeDDyW7H9c1pJ4EtZmy9wiHaeO1
         zUj0mggnHP4XcLWNfaRHJcqaAYDQk7Jj6rNOuP3G+1TxgI8R5C0+5eSykhphU74ugl8k
         CjUDkFWhm4z7QOk6ZX4V8HhaY0F9vvZUD1DvKECgJ6EX6/thvd5yEM5Yc6rjQ3r+zJSA
         697A==
Content-Disposition: inline
In-Reply-To: <CAOh2x=ms1j1j=qV2zkd_KQiwLGirPvwQkV=7b=gnbBR34TxKng@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org

On Mon, May 20, 2013 at 03:16:56PM +0530, Viresh Kumar wrote:
> Some known bugs are fixed during 3.10-rc2. Can you please check that to
> see if it works for you?
> 
> They should already be there in linus's master branch.
> 

OK, I'll update and report back if it comes up again.

Thanks
-- 
Ross Lagerwall
