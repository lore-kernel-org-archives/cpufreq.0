From: "Kenneth Chen" <kenneth.w.chen@intel.com>
Subject: RE: add lowpower_idle sysctl
Date: Thu, 18 Mar 2004 10:29:13 -0800
Sender: linux-ia64-owner@vger.kernel.org
Message-ID: <200403181829.i2IITEF10447@unix-os.sc.intel.com>
References: <20040318090522.GC15526@dominikbrodowski.de>
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <20040318090522.GC15526@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Dominik Brodowski' <linux@dominikbrodowski.de>
Cc: Andrew Morton <akpm@osdl.org>, linux-ia64@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, CPU Freq ML <cpufreq@www.linux.org.uk>

>>>>> Dominik Brodowski wrote on Thu, March 18, 2004 1:05 AM
> I assume ia64 does idling using the ACPI processor.c driver?

No, not really.

> If so, couldn't writing to /proc/acpi/processor/./power be
> an option?

Not all platform has ACPI support, so going through ACPI isn't
generic enough.


