From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 0/5] Add P state driver for Intel Core Processors
Date: Wed, 13 Feb 2013 22:17:58 +0100
Message-ID: <6075901.uWCJMxDDFf@vostro.rjw.lan>
References: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com> <20130212214949.GA1003@redhat.com> <511BC16C.7040807@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <511BC16C.7040807@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On Wednesday, February 13, 2013 08:38:04 AM Dirk Brandewie wrote:
> Hi Dave,
> 
> On 02/12/2013 01:49 PM, Dave Jones wrote:
> > On Wed, Feb 06, 2013 at 09:02:07AM -0800, dirk.brandewie@gmail.com wrote:
> >
> > Won't you also need to patch drivers/cpufreq/acpi-cpufreq.c to not load
> > on the processors that you want this driver to run on ?
> >
> > 	Dave
> >
> 
> For the case where both are built-in the load order works my driver uses
> device_initcall() and acpi_cpufreq uses late_initcall().
> 
> For the case where both are a module (which I was sure I tested) you are right
> I will have to do something.
> 
> For now I propose to make my driver built-in only while I sort out the right
> solution for the module build.  Does this seem reasonable to everyone?

Well, I've been saying I think your driver should be non-modular from the
start. :-)

May I ask for a kernel command line switch to prevent it from registering if
the user doesn't actually want it, though, if it's going to be non-modular?

Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
