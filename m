From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] powernow-k7: Userspace PST for Athlon XP-M on desktop
	boards
Date: Mon, 14 Jun 2004 23:48:03 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040614214803.GA17747@dominikbrodowski.de>
References: <20040614211726.905A94BAAB@nathan.muc.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040614211726.905A94BAAB@nathan.muc.de>
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
To: Harald Milz <milz@seneca.muc.de>
Cc: cpufreq@www.linux.org.uk

On Mon, Jun 14, 2004 at 11:17:26PM +0200, Harald Milz wrote:
> +MODULE_PARM (mycpuid, "i");
> +MODULE_PARM (myfsbspeed, "i");
> +MODULE_PARM (mymaxfid, "i");
> +MODULE_PARM (mystartvid, "i");
> +MODULE_PARM (mynumpstates, "i");

Please use module_param{,_array}() instead -- MODULE_PARM is deprecated.

> +				for (i=0; i<mynumpstates; i++) {
> +					*t = myfids[i]; t++;
> +					*t = myvids[i] == 0 ? mystartvid : myvids[i] ; t++;
> +					dprintk (KERN_INFO PFX "fid: 0x%x; vid: 0x%x; t: %p\n", myfids[i], myvids[i], t);
> +				}				
> +				psb->numpst = 1;
> +			}
> +

Some sanity checking is definitely necessary, IIRC Bruno's
in-kernel-hardcoded-table did have some. I have no opinion yet which way
(Bruno's in-kernel or your module-parameter) is preferrable...

	Dominik
