From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/7] cpufreq: Retrieve current frequency from scaling
 drivers with internal governors
Date: Wed, 6 Feb 2013 07:11:22 +0530
Message-ID: <CAOh2x=nBrjL1EZsR1ajPDjQx0V8L4jzQxvLSzU3TuupuYhSJeA@mail.gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
	<1360088646-19104-3-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=RLQFdi647x4lxGLabcFF6OMKRhszIGbuy/vFrvUOaQw=;
        b=YLhyjXqr+qKT924JVUIvkGlPhbj4WjGtkH+Twzo96PRbxitCt1D+d/8hUd7lNcQ5bS
         A1mpzzBcBUrfyZz6ScsS491wQYQXil0UMdAIMcgeQ6eRZZ/k9xUgw1VXLNhrcFxXpkf9
         QhYtL00bzdDo8SE1OMf5XHX4x/x5EWkIy5G/bVXtKAQSZgj9KSZ2brhzOiMwTc72Ivii
         XzpEODe5GVL7VMJTFb2rJEGN83IVbbuyCh+ii5QlzXm+tqjCfHw3n5jMV4+4p5hIIOSf
         eTWvBfBgfXFO6U7gwKiVE+YC++ldOnfX0pWEmdn2P2AnA1X29zNkbJADgjAxg6Cvfptf
         wG8Q==
In-Reply-To: <1360088646-19104-3-git-send-email-dirk.brandewie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Tue, Feb 5, 2013 at 11:54 PM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> Scaling drivers that implement the cpufreq_driver.setpolicy() versus
> the cpufreq_driver.target() interface do not set policy->cur.

> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>

> From: Dirk Brandewie <dirk.brandewie@gmail.com>
> Date: 2013-02-04 18:44:40 -0800
>
> cpufreq: balance out cpufreq_cpu_{get,put} for scaling drivers using setpolicy

> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>

Wow!! Something happened here. :)
