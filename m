From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH 0/5] Add P state driver for Intel Core Processors
Date: Wed, 13 Feb 2013 08:38:04 -0800
Message-ID: <511BC16C.7040807@gmail.com>
References: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com> <20130212214949.GA1003@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=W4gfkFpAdb0DIPVQguyyhQHvrFVEDBB5zeB68e5dDZY=;
        b=gTfSSEcQOhMHu24oBYvJhC2fUy7jL2OjMpCwiFton32cQP7I9bgvrCoBkNg0TMJ5YC
         v2bSKS5mca1RPPgrTbUxhV8gGQsfwScZe78wYDqjyDu8Tc4cLm/iKU/Dsf/bpm6St+35
         zLKPIa0No7PmibrsWCq/kyIr+jsXTQkIt+bSJPSqoL1ReKjC8LcC69MyKgEDm3wcEYdu
         rocxbfb0cWkGwiELcofgINutWklFKCHCpgfkA9kmZFOpB6m+Q5IZxmUi0iwWTMThFUAq
         040FO7DshxAOy/mlbVSMMGPBWdqEYR5s8wNzQDcz1xHLXQ7sGRkja5v0LL0O3cnKfiKj
         zdxQ==
In-Reply-To: <20130212214949.GA1003@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

Hi Dave,

On 02/12/2013 01:49 PM, Dave Jones wrote:
> On Wed, Feb 06, 2013 at 09:02:07AM -0800, dirk.brandewie@gmail.com wrote:
>
> Won't you also need to patch drivers/cpufreq/acpi-cpufreq.c to not load
> on the processors that you want this driver to run on ?
>
> 	Dave
>

For the case where both are built-in the load order works my driver uses
device_initcall() and acpi_cpufreq uses late_initcall().

For the case where both are a module (which I was sure I tested) you are right
I will have to do something.

For now I propose to make my driver built-in only while I sort out the right
solution for the module build.  Does this seem reasonable to everyone?

--Dirk
