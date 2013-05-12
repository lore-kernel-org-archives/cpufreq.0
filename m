From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Bug 57941] New: Cpufreq stats are not shown in sysfs
Date: Sun, 12 May 2013 20:48:55 +0530
Message-ID: <CAOh2x=n-LEEX3QrBu6fng5DqVCtrDuJwnP_JsLBMGn1duw02Aw@mail.gmail.com>
References: <bug-57941-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=zUAqGnUpG+KgpNLHcuUx5Rd5YEPeTpzbEMCsD9NCH+U=;
        b=A/R7k2N/4NGf4G0z+f86Ee3LRPRxVD7qaW+Zss8MLk37k+l9XrSXRJWLjume34+F7s
         JFmPNOlnK1qwZstj+NvNtl/lHPSdVCblmmo6e3wTash3H++/FnTwlfQcGkpZWVq6+g0+
         uaAMypryOI8f7r8nVZ7iLq4r6o8CRdC7qQrSZiPcasJwVWH+GNfqtK9THjp/YYJspBks
         LCUnINnWGdo7tLKoRtMsaHMR6dfkEn7jSdxi8I1nKYdllp52cyRyz/TXQgAly6dYFYFw
         oTY8cZ9uju3Q/mBoNfwGIMGf8I662PBHTPHIDyB6FuAKYNzvzZEi1pxzV0JoLaBm0rRW
         73/g==
In-Reply-To: <bug-57941-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bugzilla-daemon@bugzilla.kernel.org
Cc: cpufreq@vger.kernel.org

On Fri, May 10, 2013 at 5:37 PM,  <bugzilla-daemon@bugzilla.kernel.org> wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=57941
>
>            Summary: Cpufreq stats are not shown in sysfs
>            Product: Power Management
>            Version: 2.5
>     Kernel Version: 3.9
>           Platform: All
>         OS/Version: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: cpufreq
>         AssignedTo: cpufreq@vger.kernel.org
>         ReportedBy: jlec@gentoo.org
>         Regression: Yes
>
>
> Created an attachment (id=101061)
>  --> (https://bugzilla.kernel.org/attachment.cgi?id=101061)
> config.gz
>
> I am missing /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state after
> switching from 3.8 to 3.9.

Only this one is missing or complete stats directory?
