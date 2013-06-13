From: Xiaoguang Chen <chenxg.marvell@gmail.com>
Subject: Re: [PATCH v4] cpufreq: fix governor start/stop race condition
Date: Thu, 13 Jun 2013 13:40:16 +0800
Message-ID: <CAFgnuDeeU5qALyqN4Akpi5SoHRXPWaq_PLYSSmjxkq9V5N=qag@mail.gmail.com>
References: <1371028189-15758-1-git-send-email-chenxg@marvell.com>
	<CAKohponeWuaXPah4s9GjO-fLwQNuyKidUFosN1iE+e7bngDPdQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=ZmQMUeBNN68Bcxh2h2uKKlOnQgNwQo8iRQVLZM42nRM=;
        b=FGByTijk0gky5hpTuPLVHKf9tF84KL5PFOq11RgCdFg2sDsbzkGNIZpr6Ptb1fzVIr
         epvQRIlBh3Al6+xrQKLSBV2Fh10pcamc3zwls0OeAHy1JKuCRGdRjsGdBpw+XsViy/Bm
         Sz+rEdfWKUjMagbyo+HJGRqQ3m+MOhYYLWLJt0oH6rMAImBV4tmU75Ly0WL016i7jn+c
         /nU30DPT+eLAGE+eMsDFKfWN+XpzHiA+r4LP2CbGJ+LqjmWC8LuS/UuEDx3CHBjPzHnm
         nw5eUR1l7L34DOw/NleGBRifmko6w2HtAkp/skYHz5BZ1RqnR6pVOqKjv8m48qp9iaSX
         Foaw==
In-Reply-To: <CAKohponeWuaXPah4s9GjO-fLwQNuyKidUFosN1iE+e7bngDPdQ@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Xiaoguang Chen <chenxg@marvell.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, njiang1@marvell.com, zjwu@marvell.com, ylmao@marvell.com

2013/6/12 Viresh Kumar <viresh.kumar@linaro.org>:
> On 12 June 2013 14:39, Xiaoguang Chen <chenxg@marvell.com> wrote:
>
>>         ret = policy->governor->governor(policy, event);
>
> We again reached to the same problem. We shouldn't call
> this between taking locks, otherwise recursive locks problems
> would be seen again.

But this is not the same lock as the deadlock case, it is a new lock,
and only used in this function. no other functions use this lock.
I don't know how can we get dead lock again?

Thanks
Xiaoguang
