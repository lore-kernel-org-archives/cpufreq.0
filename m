From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] kirkwood: fix coccicheck warnings
Date: Mon, 11 Mar 2013 21:49:31 +0800
Message-ID: <CAOh2x==ECHa4=5Xz+7B9KVJh_8FM1=QndoFkG-unR_8+4PeTWg@mail.gmail.com>
References: <1362987319-6369-1-git-send-email-silviupopescu1990@gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=jJCbdFinidhCc3mN+Rh1zKmjcPFkwyvyjA5GxMEwE6U=;
        b=l1FU2DyIChBW9/FC5yal2fklrG9fJrn2nwAPGOZvn1PJgcrHD/bt9BF50aHWOSjr7N
         ExpDwffqWxB/ebjSuRIyycWny69Y1K84YnXW7RNTjDAx3TAtf5z6TMHDrJrhfwQmzSr2
         eY4CakVr4H2S2ZOW0p1AaCrkXq9fpqFtyudgxWN90x7z5DEYIY0beecpFqjNIfOYzpuv
         cIMiKhUGR60TUkbngpc8PzqJ0zdS/N4BdhNIk0yqxj3OTeCgNYznM4jpjw3P7diVsCih
         8qrBQb4yZf+cbEcM2mqPWDTlZDA2g5+4MGUMBf1LtaKRzSjZPymF0wOnwKCgtQ4WOscW
         Etig==
In-Reply-To: <1362987319-6369-1-git-send-email-silviupopescu1990@gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Silviu-Mihai Popescu <silviupopescu1990@gmail.com>
Cc: cpufreq@vger.kernel.org, rjw@sisk.pl, rui.zhang@intel.com, andrew@lunn.ch, jason@lakedaemon.net, rob.lee@linaro.org, len.brown@intel.com, khilman@ti.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Mar 11, 2013 at 3:35 PM, Silviu-Mihai Popescu
<silviupopescu1990@gmail.com> wrote:
> Convert all uses of devm_request_and_ioremap() to the newly introduced
> devm_ioremap_resource() which provides more consistent error handling.
>
> devm_ioremap_resource() provides its own error messages so all explicit
> error messages can be removed from the failure code paths.
>
> Signed-off-by: Silviu-Mihai Popescu <silviupopescu1990@gmail.com>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
