From: Dave Jones <davej@suse.de>
Subject: Re: [PATCH] cpufreq: speedstep-lib, speedstep-ich cleanup
Date: Thu, 26 Jun 2003 02:48:31 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030626024831.A31502@suse.de>
References: <20030616200415.GA4279@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030616200415.GA4279@brodo.de>; from linux@brodo.de on Mon, Jun 16, 2003 at 10:04:15PM +0200
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@www.linux.org.uk

On Mon, Jun 16, 2003 at 10:04:15PM +0200, Dominik Brodowski wrote:
 > - separate functions which might be useful for speedstep-piix4,
 >   speedstep-via or speedstep-bios into a new speedstep-lib.c.
 > - clean up speedstep-ich as it will only be used for ICH-based chipsets
 >   in future.
 > - remove now-obsolete speedstep_coppermine parameter

Thanks, applied to working tree (I'll merge CVS again after I've
merged another batch of patches which I've backlogged whilst moving
house).

        Dave 

-- 
| Dave Jones.        http://www.codemonkey.org.uk
| SuSE Labs
