From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Intel Core2 Duo E6600 reports max-frequency of just 900 MHz
 instead of 2.4 GHz
Date: Sun, 31 Mar 2013 09:37:16 +0530
Message-ID: <CAOh2x==5_UXqSjMT9bjrKNLC4xrFCw7jeahkAoo6UHSdz3KE7w@mail.gmail.com>
References: <20130331012053.220de31f@intellistation.kalteis>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=JQVnA3ivrAxYQM5wVGhYVPW5stM7+47cL3HWklPMlb4=;
        b=t3gKoXNmC77PJapJQBzReuQ2PesDVBdfGGYCAJ1whHPGWfRVMbTxVFEEfhPV3KXXmh
         srjG0P49PilLPVQw67KioViH+1IwwL83Ndd30LVLxpwOlt0dXQT0ixU7JF49DUsbPkNa
         K2uDkslSPrY50WQfRDKmaafAo5fdOcRAyzZmt4XQcebKHwJzhM21rWaeYbVQ3pz8b6l9
         PXBex+7n50iPArUwo0xvJ3VsOu4cfMX9dcspB//bkax5kAwFzaVJR7HdrJ8DqWNcLu09
         fZkx/tFizQICippvI7G67FJy0OOJERZEFJy8PAUsAAR7wqzTVeqZZafNSVMLs3Y7oI3S
         zC7g==
In-Reply-To: <20130331012053.220de31f@intellistation.kalteis>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Kalteis <skalteis@kernelspace.de>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On Sun, Mar 31, 2013 at 5:50 AM, Simon Kalteis <skalteis@kernelspace.de> wrote:
> Hello!
>
> I discovered that my IBM Intellistation M Pro 9229Y with its Intel
> Core2 Duo E6600 is reported to clock only at a max frequency of 900.000
> MHz instead of 2.4 GHz.

Can we have output of cpufreq-info util?
