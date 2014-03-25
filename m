From: rosslagerwall@gmail.com
Subject: Re: [stable request <=3.7] acpi-cpufreq: set current frequency based
 on target P-State
Date: Tue, 25 Mar 2014 22:18:03 +0000
Message-ID: <20140325221803.GA32518@hobo.lan>
References: <20131220081912.GA13684@hobo.Home>
 <1395785057-28903-1-git-send-email-vlee@twopensource.com>
Mime-Version: 1.0
Return-path: <stable-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=44qwlSCfCBJ7EVmW6HS0iuHXqvxKALt8m0mGN0TZz8o=;
        b=EG9+8GT3RB8CxRr05h7Ob+pdO9OGl1YpkuU7Ik5jBu7APOzmGoaKkiRKzchGdLY/OM
         aGLPH64vKTWO5RAjS9XgSQtDx60b67LZGAWHOdLdc0Ab5P3/t5uZy2578OCoPGBezaKZ
         F/+mU1J31h0KoniTzkF0vJDW3tgpF9dlgnHO+11F5OF+vQBdamaqXG0E6uSA6JbCUYT7
         RRvj9B/meUdJu1T6Wwjpe7jm+XgocwqjSG3UZNqZYQy8YLEM3x5srJwBcsN5DeDxMbbn
         zxACUrE94oFZdGeMfDZCieOVmWAvF08Hk7fZAHEDGQyayk3EmI57kodeTRLFffHOk9U6
         XP/Q==
Content-Disposition: inline
In-Reply-To: <1395785057-28903-1-git-send-email-vlee@twopensource.com>
Sender: stable-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinson Lee <vlee@twopensource.com>
Cc: stable@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Len Brown <len.brown@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

On Tue, Mar 25, 2014 at 03:04:16PM -0700, Vinson Lee wrote:
> Hi.
> 
> Please backport upstream commit 8673b83bf2f013379453b4779047bf3c6ae387e4 
> "acpi-cpufreq: set current frequency based on target P-State" to stable 
> kernels 3.7 and earlier. This patch enables the kernel to control 
> P-states on several platforms. Without this patch, the kernel was unable 
> to control P-states on the same platforms.
> 
> The upstream patch cleanly applies to 3.7.
> 
> A backported patch is needed with the removal of SYSTEM_AMD_MSR_CAPABLE 
> for kernels 3.6 and earlier.
> 

I seem to recall that the problem was a regression introduced by commit
5a1c0228 (cpufreq: Avoid calling cpufreq driver's target() routine if
target_freq == policy->cur) which was introduced in the 3.8 cycle.  Are
you sure it is necessary for kernels < 3.8?

Regards
-- 
Ross Lagerwall
