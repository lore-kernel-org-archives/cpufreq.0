From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: [PATCH] 1/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Tue, 21 Oct 2003 15:01:36 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031021130136.GI13989@poupinou.org>
References: <88056F38E9E48644A0F562A38C64FB60077912@scsmsx403.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60077912@scsmsx403.sc.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@www.linux.org.uk, "Nakajima, Jun" <jun.nakajima@intel.com>, linux-acpi <linux-acpi@intel.com>, "Mallick,
	Asit K" <asit.k.mallick@intel.com>, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@brodo.de>


There is already a patch from Dominik Brodowski for the apci p-state which IMHO
is better at least by design.  Your do not handle correctly other processors
than Intel.  But the HT stuff may be interresting, though.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
