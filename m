From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: About p4-clockmod breakage/removal
Date: Wed, 14 May 2008 01:56:36 +0100
Message-ID: <20080514005636.GA21608@srcf.ucam.org>
References: <48246C3E.7010608@ceibo.fiec.espol.edu.ec> <200805132048.00653.lenb@kernel.org>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200805132048.00653.lenb@kernel.org>
Sender: linux-acpi-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Len Brown <lenb@kernel.org>
Cc: cpufreq@lists.linux.org.uk, Alex =?iso-8859-1?B?VmlsbGFj7a1z?= Lasso <avillaci@ceibo.fiec.espol.edu.ec>, linux-acpi@vger.kernel.org

On Tue, May 13, 2008 at 08:48:00PM -0400, Len Brown wrote:

> Assuming this is a laptop with a batter,
> I'd certainly be interested if you could run BLTK
> and measure any benefit to p4-clockmod (I've never
> been able to)

The most plausible benefit to p4-clockmod is its utility in throttling 
the CPU if it would otherwise cause the system to overheat. From that 
point of view, I think it's worth keeping around - especially since not 
all machines expose T states via ACPI.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
