From: Marco Aurelio Stelmar Netto <stelmar@cpad.pucrs.br>
Subject: Re: last alternative : program to consume CPU?!
Date: Thu, 9 Sep 2004 21:27:42 -0300 (BRT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.58.0409092121100.16351@marfim.cpad.pucrs.br>
References: <Pine.LNX.4.58.0409091132010.31562@marfim.cpad.pucrs.br>
	<20040909161313.GA5182@dominikbrodowski.de>
	<Pine.LNX.4.58.0409091321560.6133@marfim.cpad.pucrs.br>
	<39e348480409091711781f182@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <39e348480409091711781f182@mail.gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: GoatZilla <goatzilla@gmail.com>
Cc: cpufreq@www.linux.org.uk

Hi,
I'm almost there.
A friend of mine gave me a program to consume CPU. I'm just performing
some tuning in it. Of course it is not an elegant solution, but I think
it will resolve my problem. Note that suggestions are still very welcome
;)

--------------------------------
#define RESOLUTION 1000000

struct itimerval value;
unsigned long busy, idle;

void sigHandler(int signum) {
  usleep(idle);
  setitimer(ITIMER_REAL, &value, NULL);
}

int main(int argc, char **argv) {

  struct sigaction sa;
  float perc;

  if(argc != 2) {
    printf("Usage: %s <value>\n", argv[0]);
    exit(0);
  }

  perc = atof(argv[1]);

  if((perc < 0) || (perc > 1)) {
    printf("Value must be between 0 and 1\n");
    exit(0);
  }

  busy = perc*RESOLUTION;
  idle = (1-perc)*RESOLUTION;

  memset(&sa, 0, sizeof(sa));
  sa.sa_handler = sigHandler;

  sigaction(SIGALRM, &sa, NULL);

  memset(&value, 0, sizeof(struct itimerval));
  value.it_value.tv_usec = busy;

  setitimer(ITIMER_REAL, &value, NULL);

  for(;;);
  return 0;
}
-------------------------------

Thanks for your suggestion.

On Thu, 9 Sep 2004, GoatZilla wrote:

> Uhm...
>
> Treat the machine as a dual CPU resource, and load it down with 2 jobs
> instead of 1?
>
>
>
>
> On Thu, 9 Sep 2004 13:35:56 -0300 (BRT), Marco Aurelio Stelmar Netto
> <stelmar@cpad.pucrs.br> wrote:
> >
> > The BIOS of my machine does not support the modification of the CPU speed.
> >
> > My problem is that I have a homogeneous cluster composed of 16 machines
> > and I need to perform some tests of my application on a heterogeneous
> > cluster. So my first option was to change the cpu speed in the BIOS, but
> > failed. The second option was to find some support in the linux itself.
> > I have found the cpufreq, but failed. My last option is to implement or
> > find a program to consume a percentage of CPU. Do you know where I can
> > find a good program to perform this task? Or do you know another alternative
> > to solve my problem?
> >
> > Thank you very much for your attention.
> >
> > Marco
> >
> > On Thu, 9 Sep 2004, Dominik Brodowski wrote:
> >
> > > On Thu, Sep 09, 2004 at 11:46:35AM -0300, Marco Aurelio Stelmar Netto wrote:
> > > >
> > > > Hello,
> > > >
> > > > I have a machine (desktop machine) HP EP-C c10 with a Pentium III
> > > > (Coppermine) 1GHz and I'm making some performance tests so I would like
> > > > to have the machine processor working at 500 MHz. I have configured the
> > > > cpufreq option (kernel 2.6.6) but the cpufreq directory in
> > > > /sys/devices/system/cpu/cpu0 does not exist.
> > > ...
> > > > I don't know if I have made some mistake or my cpu does not support the
> > > > cpufreq. I have tried to modify the clock frequency via BIOS, but such an
> > > > option is not available. All I want is to modify the clock frequency. It
> > > > does not need be on-the-fly.
> > >
> > > A desktop Coppermine Pentium III does not support SpeedStep, so no cpufreq
> > > support exists. Possibly you can change the CPU speed in your system BIOS.
> > >
> > >       Dominik
> > >
> >
> > _______________________________________________
> > Cpufreq mailing list
> > Cpufreq@www.linux.org.uk
> > http://www.linux.org.uk/mailman/listinfo/cpufreq
> >
>
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
>
