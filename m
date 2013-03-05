From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Dynamic cpufreq_frequency_table?
Date: Wed, 6 Mar 2013 01:01:34 +0800
Message-ID: <CAOh2x==m=mco-UXL=kA3RU2MwoipFFTbtrHrHdTfSeFeRGj19A@mail.gmail.com>
References: <CAMefCkB4LVnReZmEc65qddNiW17gzVXiTWdN=uaFm5v2aycxcQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=v5+mJKIXO37WE1aciWebf3hVeTBwtQ6If9b+mvl3NsM=;
        b=MhwkTYJSXA87pyuC4i/2KtE0JwlDxenoIE/fZNLBPVm0u5x35Wb5Y0LRy1++OBNDqX
         Jy2hiClheB8H/Tw47Sr6J9Eih1dj/OHqsnOg908uJbBHpm2obclT+nkCb7LRREHlvDg5
         MdCQWvnE52+02uADXiaso/RU7pVMLPFDRCKarJDoFQT2rlHDUGMKm7W+9fUjvz7X4Od8
         1k3O8HPKSMDYJEdDSkp7qQLgTvblShu6SDr3mF75SfNesOY/NLQJ5qcjYjR82ZoNZiIt
         iTUF2crP1JPP2XdlvUH5psV1oSbdYovOQ5XWwmzuT+hFg+aFGFik0Bxoz+8gPJYf/y26
         v1vg==
In-Reply-To: <CAMefCkB4LVnReZmEc65qddNiW17gzVXiTWdN=uaFm5v2aycxcQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guru Prasad <gurupras@buffalo.edu>
Cc: cpufreq@vger.kernel.org

Hi Guru,

On Wed, Mar 6, 2013 at 12:15 AM, Guru Prasad <gurupras@buffalo.edu> wrote:
> I'm trying to run the Linux kernel with the cpufreq driver in a
> simulation environment where the CPU frequency can be modified.

Okay.

> This leaves me with two choices :
> Either have several kernels with different static cpufreq_frequency tables or

So you meant have different uImages per freq_table, right?

> let the kernel create the cpufreq_frequency_table dynamically.

Didn't get that completely :(
You want the kernel to create this table dynamically, yes we can allocate memory
for it dynamically, but we need some input from some static/dynamic code on the
kind of values you have.

So, we need a fixed freq_table before cpufreq_driver->init is called. That's it.

What you might end up doing could be unregister/register your cpufreq driver for
every new freq_table you want to test your system with. And so your
cpufreq_driver->init() can return these new tables everytime.
