From: J Webster <jw.jwebster@gmail.com>
Subject: CPU throttled down to 800 after 15-30mins
Date: Sat, 05 Feb 2011 20:56:26 +0100
Message-ID: <4D4DAB6A.6090807@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=dqTSVhTdi7VVFlFy6AKVc4jyoTZhd1uV1+UxpIlWIRs=;
        b=Obt5ewtFYZzWZ2efY3Ok4ogGv5ftV6TgmzLOgXCsu7AXnbNMQDipaDe3kROCwobTuH
         OE+QjAIqj5NlkQaQF3UAwe79rGpsemICfnum+BTjUoQA3+PTqZuMZxdXYzL4pf7eUNWd
         tBue5blaogS1kL/2GlCt1th/0Iqxuf3WhRXYs=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@vger.kernel.org

My laptop is an Inpsiron 9300, which should be able to go up to 1.73GHz.
I am having an issue whereby when I first turn the computer on, ondemand 
is selected and the speed moves between 800 and 1.73 successfully.
For no apparent reason, after 15mins it is throttled back to 800 and I 
cannot change it back.
I tired manually editing the scaling_max_freq file to 1733000 but when I 
go back to view it it has changed to 800000 again!
I thought it might be this issue:
##
# Special Rules
##
# CPU Too hot!
[Rule]
name=CPU Too Hot
acpi_temperature=55-100
cpu_interval=50-100
profile=Performance Low
[/Rule]

So I changed it from 70-100 but on the last try the cpu did  not reach 
70 and it still throttled it back to 800.

Any ideas what I can do solve this issue?
I have tried everything on this post here and no luck: 
http://ubuntuforums.org/showthread.php?p=10430797#post10430797
