From: Dominik Brodowski <linux@brodo.de>
Subject: Re: [PATCH 5/8] p4_clockmod: detect speed without relying on
	cpu_khz or user input
Date: Thu, 20 Nov 2003 19:33:35 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031120183335.GB4425@brodo.de>
References: <20031119183228.GF20576@brodo.de>
	<20031119190946.GB5653@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031119190946.GB5653@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Wed, Nov 19, 2003 at 07:09:46PM +0000, Dave Jones wrote:
> 
> patch 4/8 introduced what seems to be the exact same code in the speedstep-lib.
> Perhaps it belongs in an fsb.o instead that they can both share ?
> I don't mind duplicating it twice in object code, but having two copies
> in the source seems a bit silly.

Usually, I agree to this topic. However, I don't want to create just another
file for just this function, and it doesn't belong to speedstep-lib either
as a plain p4 isn't a valid processor for speedstep-lib. So I'd prefer to
have this source code duplication as an exception here.

	Dominik
