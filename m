From: Dave Jones <davej@redhat.com>
Subject: Re: longhaul: Unknown VIA CPU
Date: Wed, 3 Sep 2003 01:49:57 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030903004949.GA7278@redhat.com>
References: <3F55187F.70707@free.fr>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F55187F.70707@free.fr>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vincent Stehl? <vincent.stehle@free.fr>
Cc: cpufreq@www.linux.org.uk

On Wed, Sep 03, 2003 at 12:23:59AM +0200, Vincent Stehl? wrote:
 > I tried to get the longhaul module to work on my VIA EPIA M10000 
 > motherboard (C3-2 cpu), but I did not succeed yet.
 > 
 > I use cpufreq 2.4.21-2, and I see the following message in the syslog 
 > when I "modprobe longhaul":
 > 
 >     longhaul: Unknown VIA CPU. Contact davej@suse.de
 > 
 > I'd be pleased to help with what seems to be a "new" cpu, but I do not 
 > know what to begin with.

Nehemiah is still unsupported as I've not seen a production one thats
actually capable of working properly yet. Still waiting to hear back
from the folks at Centaur.

		Dave

-- 
 Dave Jones     http://www.codemonkey.org.uk
