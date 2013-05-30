From: Ross Lagerwall <rosslagerwall@gmail.com>
Subject: cpufreq turbo regression
Date: Thu, 30 May 2013 14:52:46 +0100
Message-ID: <20130530135246.GA2177@hobo.wolfson.cam.ac.uk>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:mime-version:content-type
         :content-disposition:user-agent;
        bh=xnnzsXsICTKeKU7kvlroiNh0HOtkmres30NilxQYrtk=;
        b=IQhJNN89sqmIOJ/PxhhncNeHNxdeGQuwAEcQUjf3A6TubaKwaDWS8b1GHiSdiBGpQY
         vlfxkBVHhUakZkrv6hRJnOu7wiKDexrIs62EHlOC4Sl5SXETYbVM+VKgFJPWnncqOJau
         dyHuBIExVpOs2vebmEm7AoqjiCidVNOTOHBI3nX5beOgZ3OFQWC/1r39JxISxLdB5w2o
         WsAM4ZjEZZbrHxGdBb6p+F7egqzC8r/3/5G8ImXs/aJm8Gqy3U6dweKgAl5SaJcScnJW
         VmPg/95jXHSYBnsFaSALFZU1MbvzL+N8hIXAX9D/UXSPnTL66CFhvWf2qNRPnUtMVTYz
         hT6Q==
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>

Hi,

I have an Intel 3570K and would like to run it in performance mode from
startup so I set the default governor to performance.

I noticed that when I do this, turbo mode does not seem to be activated
on the processor (turbostat shows frequencies of about 3.4GHz rather
than 3.7GHz).  If I then while it is running switch to ondemand and then back
to performance, turbo is activated properly and the cpu frequency hits 3.7GHz.

I did a git bisect and traced it to the following commit:
5a1c022850ea5d64c2997bf9b89f5ae112d5ee4d is the first bad commit
commit 5a1c022850ea5d64c2997bf9b89f5ae112d5ee4d
Author: Viresh Kumar <viresh.kumar@linaro.org>
Date:   Wed Oct 31 01:28:15 2012 +0100

    cpufreq: Avoid calling cpufreq driver's target() routine if target_freq == policy->cur
    
    Avoid calling cpufreq driver's target() routine if new frequency is same as
    policies current frequency.
    
    Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
    Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

:040000 040000 4e0d340c501120d61e5bb9553420c142037a0beb f4ed149e8563bebd6e2d1e4c56523ff9aed4314b M  drivers

Reverting this commit from v3.10-rc3 fixed the problem.

This is using the acpi-cpufreq driver -- there doesn't seem to be any way to
set the Intel P-state driver to performance by default.

Regards
-- 
Ross Lagerwall
