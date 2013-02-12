From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 0/5] Add P state driver for Intel Core Processors
Date: Tue, 12 Feb 2013 16:49:49 -0500
Message-ID: <20130212214949.GA1003@redhat.com>
References: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On Wed, Feb 06, 2013 at 09:02:07AM -0800, dirk.brandewie@gmail.com wrote:
 > From: Dirk Brandewie <dirk.brandewie@gmail.com>
 > 
 > This driver implements a scaling driver with an internal governor for
 > Intel Core processors.  The driver follows the same model as the
 > Transmeta scaling driver (longrun.c) and implements the setpolicy()
 > instead of target().  Scaling drivers that implement setpolicy() are
 > assmuned to implement internal governors by the cpufreq core. All the
 > logic for selecting the current P state is contained within the driver
 > no external governor is used by the cpufreq core.
 > 
 > At the moment only Intel SandyBridge processors are supported. As
 > testing on SandyBridge+ processors is completed support will be added
 > to the driver.

Won't you also need to patch drivers/cpufreq/acpi-cpufreq.c to not load
on the processors that you want this driver to run on ?

	Dave

